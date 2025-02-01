// Valores de tiempo
const float dt = 1E-3;   // Incremento de tiempo
double ta = 0;           // Tiempo acumulado

// Estimaciones iniciales del sensor virtual 
float xe = 1.0;  // Biomasa estimada inicial (g/L)
float ye = 21.0; // Glucosa estimada inicial (g/L)
float ze = 0.10;  // Etanol estimado inicial (g/L)

// Constantes del modelo mecanicista
const float p1 = 312.378E-3;
const float p2 = 2.2814;
const float p3 = 1.0658E-3;
const float p4 = 7.2751E-3;
const float p5 = 56.8928E-3;
const float p6 = 71.8424E-3;
const float p7 = 824.2332E-9;
const float p8 = 31.563E-3;
const float p9 = 60.706E-3;
const float p10 = 149.899E-3;

// Ganancias del sensor virtual
const float L1 = 2.0;
const float L2 = 1.5;
const float L3 = 0.4;

bool newValueReceived = false;  // Bandera que indica si se ha recibido un nuevo valor
float x = 0.0;                  // Valor de biomasa recibido

// Configuración inicial del sistema
void setup() {
  Serial.begin(57600);  // Inicia comunicación serial a 57600 baudios
  delay(5000);          // Pausa para establecer conexión
  Serial.println("t,xe,ye,ze");  // Encabezado de los datos que se enviarán por serial
}

// Bucle principal del programa
void loop() {
  if (Serial.available()) {  // Verifica si hay datos disponibles en el puerto serial
    String input = Serial.readStringUntil('\n');  // Lee la cadena hasta el salto de línea
    input.trim();  // Elimina espacios en blanco al inicio y fin
    if (input.length() > 0) {
      x = input.toFloat();  // Convierte el valor recibido a flotante (biomasa)
      newValueReceived = true;  // Se activa la bandera indicando nuevo valor
    }
  }

  if (newValueReceived) {
    // Envía tiempo y estimaciones actuales por puerto serial en formato CSV
    Serial.print(ta, 3);
    Serial.print(",");
    Serial.print(x);
    Serial.print(",");
    Serial.print(xe);
    Serial.print(",");
    Serial.print(ye);
    Serial.print(",");
    Serial.println(ze);
    // Cálculo del siguiente estado del sensor virtual usando Runge-Kutta
    rungeKutta4(x, xe, ye, ze, ta, dt);
    newValueReceived = false;  // Reinicia la bandera
  }
}

// Método Runge-Kutta de cuarto orden para actualizar el estado del sensor virtual
void rungeKutta4(float x, float &xe, float &ye, float &ze, double &ta, float dt) {
  // Declaración de las variables para las pendientes
  float k1xe, k1ye, k1ze;
  float k2xe, k2ye, k2ze;
  float k3xe, k3ye, k3ze;
  float k4xe, k4ye, k4ze;
  // Cálculo de pendientes para actualizar el estado del sensor virtual
  sensorVirtual(x, xe, ye, ze, k1xe, k1ye, k1ze);
  sensorVirtual(x, xe + 0.5 * dt * k1xe, ye + 0.5 * dt * k1ye, ze + 0.5 * dt * k1ze, k2xe, k2ye, k2ze);
  sensorVirtual(x, xe + 0.5 * dt * k2xe, ye + 0.5 * dt * k2ye, ze + 0.5 * dt * k2ze, k3xe, k3ye, k3ze);
  sensorVirtual(x, xe + dt * k3xe, ye + dt * k3ye, ze + dt * k3ze, k4xe, k4ye, k4ze);
  // Actualización del estado del sensor virtual con la combinación ponderada de las pendientes
  xe += (dt / 6) * (k1xe + 2 * k2xe + 2 * k3xe + k4xe);
  ye += (dt / 6) * (k1ye + 2 * k2ye + 2 * k3ye + k4ye);
  ze += (dt / 6) * (k1ze + 2 * k2ze + 2 * k3ze + k4ze);
  ta += dt;   // Incrementar el tiempo acumulado
}

// Modelo mecanicista con suma ponderada del producto de las ganancias y el error
void sensorVirtual(float x, float xe, float ye, float ze, float &dxe, float &dye, float &dze) {
  dxe = ((p1 * xe * ye) / (p2 + ye)) - (p3 * xe * ze) - (p4 * xe) + L1 * (x - xe);
  dye = -(p5 * xe * ye) - (p6 * ye * ze) - (p7 * ye) + L2 * (x - xe);
  dze = (p8 * xe * ze) + (p9 * ye * ze) - (p10 * ze) + L3 * (x - xe);
}