#include "DHT.h"
#define dht_type DHT11 // Definindo qual o tipo de sensor DHTxx que se esta utilizando
int dht_pin = A1;
DHT dht_1 = DHT(dht_pin, dht_type); // Pode-se configurar diversos sensores DHTxx
const int LM35 = A5; 

void setup(){
  Serial.begin(9600);
  dht_1.begin();
}

void loop(){
  float umidade = dht_1.readHumidity();
  float temperatura = dht_1.readTemperature();
  float temperatura_lm35 = (float(analogRead(LM35))*5/(1023))/0.01;
  if (isnan(temperatura) or isnan(umidade) or isnan(temperatura_lm35)){
    Serial.println("Erro ao Ler o Sensor");
  }else{
    Serial.print(temperatura_lm35); // Temperatura do LM35 sendo mais sensivel
    Serial.print(",");
    Serial.print(umidade); // Umidade DHT11
    Serial.print(",");
    Serial.println(temperatura);
  }
  delay(500);
}