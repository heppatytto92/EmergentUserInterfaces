/*
  Example Bluetooth Serial Passthrough Sketch
 by: Jim Lindblom
 SparkFun Electronics
 date: February 26, 2013
 license: Public domain
 
 This example sketch converts an RN-42 bluetooth module to
 communicate at 9600 bps (from 115200), and passes any serial
 data between Serial Monitor and bluetooth module.
 */
#include <SoftwareSerial.h>  

// Bluetooth pin assignment

int bluetoothTx = 2;  // TX-O pin of bluetooth mate, Arduino D2
int bluetoothRx = 4;  // RX-I pin of bluetooth mate, Arduino D3

SoftwareSerial bluetooth(bluetoothTx, bluetoothRx);

// setup variables for pressure sensor
int fsrAnalogPin = 0; // FSR is connected to analog 0
int fsrReading;      // the analog reading from the FSR resistor divider


void setup()
{
  Serial.begin(9600);  // Begin the serial monitor at 9600bps

  //bluetooth.begin(115200);  // The Bluetooth Mate defaults to 115200bps
  //bluetooth.print("$$$");  // Enter command mode
  //delay(100);  // Short delay, wait for the Mate to send back CMD
  //bluetooth.println("U,9600,N");  // Temporarily Change the baudrate to 9600, no parity
  // 115200 can be too fast at times for NewSoftSerial to relay the data reliably
  bluetooth.begin(9600);  // Start bluetooth serial at 9600
}

void loop()
{
  fsrReading = analogRead(fsrAnalogPin);
  //Serial.print("Pressure: ");
  //Serial.println(fsrReading);

  bluetooth.println(fsrReading);
  delay(3000);
}

