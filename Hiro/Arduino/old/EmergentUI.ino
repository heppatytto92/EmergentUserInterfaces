// CS-E4200 Emergent UI sample code
// Created by Hiroki Sunagawa

// This library allows you to communicate with I2C / TWI devices.
#include<Wire.h>

//setup variables for accelerometer
const int MPU_addr=0x68;  // I2C address of the MPU-6050
int16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ;

// setup variables for pressure sensor
int fsrAnalogPin = 0; // FSR is connected to analog 0
int fsrReading;      // the analog reading from the FSR resistor divider

// setup variables for proximity sensor
int URPWM = 3; // PWM Output 0－25000US，Every 50US represent 1cm
int URTRIG = 5; // PWM trigger pin
unsigned int Distance=0;
uint8_t EnPwmCmd[4]={0x44,0x02,0xbb,0x01};    // distance measure command


void setup(){
// Accelerometer setup
  I2C_Mode_Setup();

// setup for proximity sensor
  PWM_Mode_Setup();

  Serial.begin(9600);

}

// Main function

void loop(){
  // Pressure sensor value
  fsrReading = analogRead(fsrAnalogPin);
  Serial.print("Pressure: ");
  //Serial.println(fsrReading);
  Serial.print(fsrReading);
  // Prox sensor
  // READ_ProximitySensor();

  // Accelerometor
  READ_Accelerometor();
  delay(500);
}


// PWM Mode setup for proximity sensor

void PWM_Mode_Setup()
{
  pinMode(URTRIG,OUTPUT);                     // A low pull on pin COMP/TRIG
  digitalWrite(URTRIG,HIGH);                  // Set to HIGH

  pinMode(URPWM, INPUT);                      // Sending Enable PWM mode command

  for(int i=0;i<4;i++)
  {
      Serial.write(EnPwmCmd[i]);
  }
}

// A function to read proximity sensor value

void READ_ProximitySensor()
{                              // a low pull on pin COMP/TRIG  triggering a sensor reading
    digitalWrite(URTRIG, LOW);
    digitalWrite(URTRIG, HIGH);               // reading Pin PWM will output pulses

    unsigned long DistanceMeasured=pulseIn(URPWM,LOW);

    if(DistanceMeasured>=10200)
    {              // the reading is invalid.
      Serial.println("Invalid");
    }
    else
    {
      Distance=DistanceMeasured/50;           // every 50us low level stands for 1cm
      Serial.print("Distance: ");
      Serial.print(Distance);
    }

}

// I2C Mode setup for accelerometer

void I2C_Mode_Setup()
{
  Wire.begin();
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
}

// A function to read accelerometer value

void READ_Accelerometor()
{
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_addr,14,true);  // request a total of 14 registers
  AcX=Wire.read()<<8|Wire.read();  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY=Wire.read()<<8|Wire.read();  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ=Wire.read()<<8|Wire.read();  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  Tmp=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  GyX=Wire.read()<<8|Wire.read();  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY=Wire.read()<<8|Wire.read();  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ=Wire.read()<<8|Wire.read();  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  Serial.print(", AcX: "); Serial.print(AcX);
  Serial.print(", AcY: "); Serial.print(AcY);
  Serial.print(", AcZ: "); Serial.print(AcZ);
  //Serial.print(", Tmp: "); Serial.print(Tmp/340.00+36.53);  //equation for temperature in degrees C from datasheet
  Serial.print(", GyX: "); Serial.print(GyX);
  Serial.print(", GyY: "); Serial.print(GyY);
  Serial.print(", GyZ: "); Serial.println(GyZ);
}
