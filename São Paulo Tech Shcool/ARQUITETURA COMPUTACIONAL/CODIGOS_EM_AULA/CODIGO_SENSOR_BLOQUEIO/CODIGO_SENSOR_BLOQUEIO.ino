int pinoSensor = 7;
int TempoUsoSegundos = 0;
int TempoLivreSegundos = 0;
int horasLivre = 0 ; 
int minutosLivre = 0;
int segundosLivre = 0;
int horasUso = 0 ; 
int minutosUso = 0;
int segundosUso = 0;
    

void setup() {
  pinMode(pinoSensor, INPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(pinoSensor) == LOW) {
    segundosUso = TempoLivreSegundos;
    minutosUso = TempoLivreSegundos / 60;
    horasUso = TempoLivreSegundos / 3600;
    TempoUsoSegundos++; 
  } else {
    segundosLivre = TempoUsoSegundos;
    minutosLivre  = TempoUsoSegundos / 60;
    horasLivre = TempoUsoSegundos / 3600;
    TempoLivreSegundos++; 
  }


  delay(1000);
}
