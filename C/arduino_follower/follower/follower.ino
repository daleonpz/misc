#include <Servo.h>
 
///////////////////////
//  GLOBAL VARIABLES
///////////////////////
Servo myservo;

///////////////////////
//  DEFINES
///////////////////////
#define ANGLE_OFFSET 7
#define SERVO_PORT 7
// RED: power ,BROWN: GND, ORANGE: control

#define L_trig  13
#define L_echo  12
#define M_trig  11
#define M_echo  10
#define R_trig  9
#define R_echo  8 

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
    myservo.attach(SERVO_PORT);  // Use pin 7 for the servo

    pinMode(L_trig, OUTPUT); 
    pinMode(L_echo, INPUT); 
    pinMode(M_trig, OUTPUT); 
    pinMode(M_echo, INPUT); 
    pinMode(R_trig, OUTPUT); 
    pinMode(R_echo, INPUT); 
    
    Serial.begin(9600); // Starts the serial communication
}

void loop() {
    chooseDirection();
    Serial.println("");
}
