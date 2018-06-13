#include <Servo.h>
#include <SoftwareSerial.h>

///////////////////////
//  GLOBAL VARIABLES
///////////////////////
Servo myservo;
SoftwareSerial BT(5,6); // RX, TX

///////////////////////
//  DEFINES
///////////////////////
#define ANGLE_OFFSET 7
#define SERVO_PORT 7    // RED: power, BROWN: GND, ORANGE: control

#define L_trig  13
#define L_echo  12
#define M_trig  11
#define M_echo  10
#define R_trig  9
#define R_echo  8 

#define MOTOR_Pin 3       //Output pin number for the motor
#define MOTOR_Max 120
#define MOTOR_Min 0

#define LED_BT A4
#define LED_B A5
#define Button 2

int BTstate = 0;
int motor_speed = 0;

///////////////////////
//  FUNCTIONS
///////////////////////
void turn_left(){
    myservo.write(100+ANGLE_OFFSET);
}

void turn_right(){
    myservo.write(80+ANGLE_OFFSET);
}

void go_straight(){
    myservo.write(90+ANGLE_OFFSET);
}

unsigned long readUltrasoundDistance(int trigPin, int echoPin){
    unsigned long duration, distance;
    digitalWrite(trigPin, LOW);  // Clears the trigPin
    delayMicroseconds(2);      
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);// Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, LOW);
    duration = pulseIn(echoPin, HIGH);
    distance = duration*0.01716;
    Serial.print("\t");
    Serial.print(distance);
    return distance; 
}

void motor_ON() {
    while (motor_speed < MOTOR_Max) {
        motor_speed += 5;
        analogWrite(MOTOR_Pin, motor_speed);
        delay(20);
  }
}

void motor_OFF() {
    while (motor_speed > MOTOR_Min) {
        motor_speed -= 5;
        analogWrite(MOTOR_Pin, motor_speed);
        delay(20);
  }
}

void call_bart(){
    int buttonState = digitalRead(Button);
    if ( buttonState == HIGH ){
        digitalWrite(LED_B, HIGH);
        delay(1000);
    }
    else
         digitalWrite(LED_B, LOW);
}

int validPassword() {
    String pass = "amazon" ;
    String S = "" ;
    if (BT.available()) {
        char c = BT.read(); 
        while ( c != '\n') {           //Hasta que el caracter sea intro
            S = S + c;
            c = BT.read();
            //delay(25) ;
        }
        Serial.print(S);
    }
    if (pass == S) return 1;
    else return -1;
}

void authentication (){
     if ( validPassword() > 0 ){
        digitalWrite(LED_BT, HIGH);
        delay(1000);
     }
     else 
        digitalWrite(LED_BT, LOW);
}

void chooseDirection(){
    const unsigned long delta = 20; 
    unsigned long left;
    unsigned long mid;
    unsigned long right; 

    left    = readUltrasoundDistance(L_trig, L_echo);
    mid     = readUltrasoundDistance(M_trig, M_echo);
    right   = readUltrasoundDistance(R_trig, R_echo);

    // Simple algorithm to choose direction
    // TODO: Update this
    left =  (left < 20)?1:0;
    right = (right < 20)?1:0;

    if (right) turn_right();
    else if  (left) turn_left(); 
    else go_straight();
}


///////////////////////
//  MAIN FUNCTIONS
///////////////////////
void setup() {
    myservo.attach(SERVO_PORT); 
 
    pinMode(L_trig, OUTPUT); 
    pinMode(L_echo, INPUT); 
    pinMode(M_trig, OUTPUT); 
    pinMode(M_echo, INPUT); 
    pinMode(R_trig, OUTPUT); 
    pinMode(R_echo, INPUT);

    pinMode(MOTOR_Pin, OUTPUT);     
    digitalWrite(MOTOR_Pin, LOW);  
 
    BT.begin(9600);
    pinMode(LED_BT, OUTPUT);

    pinMode(LED_B, OUTPUT);
    pinMode(Button, INPUT);

    Serial.begin(9600);
}

void loop() {
    //chooseDirection();
    //motor_ON();
    //delay(3000);
    //motor_OFF();
    //delay(3000);
    call_bart();
    authentication();
}
