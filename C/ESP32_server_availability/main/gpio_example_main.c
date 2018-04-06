/* Test Project */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/event_groups.h"

#include "driver/gpio.h"

#include "esp_wifi.h"
#include "esp_system.h"
#include "esp_event.h"
#include "esp_event_loop.h"
#include "nvs_flash.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/dns.h"

#define LED_RED     GPIO_NUM_12 
#define LED_GREEN   GPIO_NUM_27

#define DELAY       1000

#define WIFI_SSID   "wifi_ssid"
#define WIFI_PASS   "wifi_pass"

#define WEB_URL     "a_URL"
#define WEB_PORT    "a_PORT"
#define WEB_SERVER  "an_IP" 

static const char *REQUEST = "GET " WEB_URL " HTTP/1.1\r\n"
    "Host: "WEB_SERVER"\r\n"
    "\r\n";

enum SERVER_STATUS{
    ACTIVE,
    INACTIVE
};

volatile enum SERVER_STATUS server_status = ACTIVE;

/* ------------------------------------------- */
/*   FUNCTIONS: GPIO RELATED                   */
/* ------------------------------------------- */
void availability_check (void *pvParameter){

    gpio_pad_select_gpio(LED_GREEN);
    gpio_set_direction(LED_GREEN, GPIO_MODE_OUTPUT);
    gpio_pad_select_gpio(LED_RED);
    gpio_set_direction(LED_RED  , GPIO_MODE_OUTPUT);

    while(1){
        switch (server_status){
            case ACTIVE:
                gpio_set_level(LED_GREEN, 0);
                gpio_set_level(LED_RED, 1);
                break;
            case INACTIVE:
                gpio_set_level(LED_GREEN,  1);
                gpio_set_level(LED_RED, 0);
                break; 
            default:
                gpio_set_level(LED_RED,0);
                gpio_set_level(LED_GREEN,0);
                break;
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        }
    }
}

/* ------------------------------------------- */
/*   FUNCTIONS: WIFI RELATED                   */
/* ------------------------------------------- */
static esp_err_t event_handler(void *ctx, system_event_t *event){
    return ESP_OK;
}

static void initalize_wifi(){
    tcpip_adapter_init();
    ESP_ERROR_CHECK( esp_event_loop_init(event_handler, NULL) );
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK( esp_wifi_init(&cfg) );
    ESP_ERROR_CHECK( esp_wifi_set_storage(WIFI_STORAGE_RAM) );
    ESP_ERROR_CHECK( esp_wifi_set_mode(WIFI_MODE_STA) );
    wifi_config_t sta_config = {
        .sta = {
          .ssid      = WIFI_SSID,
          .password  = WIFI_PASS,
          .bssid_set = 0
        },
    };
    // Be a wifi station
    ESP_ERROR_CHECK( esp_wifi_set_config(WIFI_IF_STA, &sta_config) );
    ESP_ERROR_CHECK( esp_wifi_start() );
    ESP_ERROR_CHECK( esp_wifi_connect() );
}


static void http_request(void *pvParameters)
{
    const struct addrinfo hints = {
        .ai_family = AF_INET,
        .ai_socktype = SOCK_STREAM,
    };
    struct addrinfo *res;
    int s;

    while(1) {
        vTaskDelay( 5000/ portTICK_PERIOD_MS); // Sample every 5 secs
        int err = getaddrinfo(WEB_SERVER, WEB_PORT, &hints, &res);
        if(err != 0 || res == NULL) {
            server_status = INACTIVE; // DNS lookup failed 
            continue;
        }

        /* Stages for Client: Open -> Connect -> Recv/Send */
        /* Open socket */
        s = socket(res->ai_family, res->ai_socktype, 0);
        if(s < 0) {  // socket not allocated 
            server_status = INACTIVE; // Failed to allocate socket
            freeaddrinfo(res);
            continue;
        }

        /* Connect to the network */
        if(connect(s, res->ai_addr, res->ai_addrlen) != 0) {
            server_status = INACTIVE; // socket connect failed
            close(s);
            freeaddrinfo(res);
            continue;
        }
        freeaddrinfo(res);

        // Send 
        if (write(s, REQUEST, strlen(REQUEST)) < 0) {
            // socket send not successful
            server_status = INACTIVE; // socket send failed
            close(s);
            continue;
        }

        struct timeval receiving_timeout;
        receiving_timeout.tv_sec = 5;
        receiving_timeout.tv_usec = 0;
        if (setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &receiving_timeout,
                sizeof(receiving_timeout)) < 0) {
            server_status = INACTIVE; // failed to set socket receiving timeout
            close(s);
            continue;
        }
       
        // Success  
        server_status = ACTIVE;
        vTaskDelay(500/ portTICK_PERIOD_MS);
        close(s);
    }
}

/* ------------------------------------------- */
/*       MAIN                                  */
/* ------------------------------------------- */
void app_main(){
    ESP_ERROR_CHECK( nvs_flash_init() );
    initalize_wifi();
    xTaskCreate(&availability_check, "AVL_CHECK", 1024, NULL, 5, NULL);
    xTaskCreate(&http_request, "HTTP_REQUEST", 4096, NULL, 5, NULL);
}



