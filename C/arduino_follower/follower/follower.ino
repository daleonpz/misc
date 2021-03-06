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
#define MOTOR_Max 130
#define MOTOR_Min 0

#define LED_BT A4
#define LED_B A5
#define Button 2

int motor_speed = 0;

enum bartStates{
    TURN_RIGHT,
    TURN_LEFT,
    STOP,
    GO
};

bartStates BTstate = GO;

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
        motor_speed += 15;
        analogWrite(MOTOR_Pin, motor_speed);
        delay(20);
  }
    Serial.print("Motor speed:  ");
    Serial.println(motor_speed);
    analogWrite(MOTOR_Pin, motor_speed);
 
}

void motor_OFF() {
    while (motor_speed > MOTOR_Min) {
        motor_speed -= 15;
        analogWrite(MOTOR_Pin, motor_speed);
        delay(20);
  }
    Serial.print("Motor speed");
    Serial.println(motor_speed);
    analogWrite(MOTOR_Pin, motor_speed);

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
        while ( c != '\n') { 
            S = S + c;
            c = BT.read();
            //delay(25) ;
        }
        Serial.println(S);
    }
    if (pass == S) return 1;
    else return -1;
}

int authentication (){
    int valid = -1;
    if ( validPassword() > 0 ){
        digitalWrite(LED_BT, HIGH);
        valid = 1 ;
        delay(1000);
     }
    else 
        digitalWrite(LED_BT, LOW);

    return valid;
}

void chooseDirection(){
    const unsigned long delta = 20; 
    const unsigned long diff = 0.8;
    unsigned long left;
    unsigned long mid;
    unsigned long right; 

    left    = readUltrasoundDistance(L_trig, L_echo);
    mid     = readUltrasoundDistance(M_trig, M_echo);
    right   = readUltrasoundDistance(R_trig, R_echo);

    Serial.println("");
    // Simple algorithm to choose direction
    // TODO: Update this

/*
    left =  (left < 20)?1:0;
    right = (right < 20)?1:0;
*/

    // it's turning but it's not close to stop
    if ((mid < delta ) )//&& (left < delta) && ( right < delta) ) 
        BTstate = STOP;

    else  if ((left < delta*1.5) && ( right > delta*1.5))
         BTstate = TURN_LEFT; 

    else if ((right < delta*1.5) && ( left > delta*1.5))
        BTstate = TURN_RIGHT;

    else
        BTstate = GO;

    Serial.print("STATE: ");
    Serial.println(BTstate);
}


void state_machines (){
    switch(BTstate) {
        case GO:
            motor_ON();
            go_straight();
            break;
        case TURN_RIGHT:
            motor_ON();
            turn_right();
            break;
        case TURN_LEFT:
            motor_ON();
            turn_left();
            break;
        case STOP:
            motor_OFF();
            break;
        default:
            motor_ON();
            go_straight();
    }
}

void direction_sm(){
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

    while (authentication() < 0){
    }
}

void loop() {
    chooseDirection();
    state_machines();
    call_bart();
}
