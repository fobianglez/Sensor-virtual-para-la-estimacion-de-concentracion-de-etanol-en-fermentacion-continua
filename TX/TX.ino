// Valores de tiempo
const float dt = 1E-3;   // Incremento de tiempo
double ta = 0;           // Tiempo acumulado

// Condiciones iniciales del sistema
float x = 0.5;  // Biomasa inicial (g/L)
float y = 21.0; // Glucosa inicial (g/L)
float z = 0.10;  // Etanol inicial (g/L)

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

// Configuración inicial del sistema
void setup() {
  Serial.begin(57600);  // Inicia comunicación serial a 57600 baudios
  delay(1000);          // Pausa para establecer conexión
}

/*
  // Fase 1 del bucle principal del programa
void loop() {
  delay(100);         // Retardo de 100 ms entre iteraciones
  // Envía tiempo y valores actuales por puerto serial en formato CSV
  Serial.print(ta, 3);
  Serial.print(",");
  Serial.print(x);
  Serial.print(",");
  Serial.print(y);
  Serial.print(",");
  Serial.println(z);
  rungeKutta4(x, y, z, ta, dt);  // Llama a la función para calcular el siguiente estado
}
*/
  // Fase 2 del bucle principal del programa
void loop() {
  delay(100);         // Retardo de 100 ms entre iteraciones
  // Envía valor actual de biomasa por puerto serial 
  Serial.println(x);
  rungeKutta4(x, y, z, ta, dt);  // Llama a la función para calcular el siguiente estado
}

// Implementación del método de Runge-Kutta de cuarto orden
void rungeKutta4(float &x, float &y, float &z, double &ta, float dt) {
  // Declaración de las variables para las pendientes
  float k1x, k1y, k1z;
  float k2x, k2y, k2z;
  float k3x, k3y, k3z;
  float k4x, k4y, k4z;
  // Calcular las pendientes intermedias para cada variable del sistema
  systemDynamics(x, y, z, k1x, k1y, k1z);
  systemDynamics(x + 0.5 * dt * k1x, y + 0.5 * dt * k1y, z + 0.5 * dt * k1z, k2x, k2y, k2z);
  systemDynamics(x + 0.5 * dt * k2x, y + 0.5 * dt * k2y, z + 0.5 * dt * k2z, k3x, k3y, k3z);
  systemDynamics(x + dt * k3x, y + dt * k3y, z + dt * k3z, k4x, k4y, k4z);
  // Actualización del estado del sistema con la combinación ponderada de las pendientes
  x += (dt / 6) * (k1x + 2 * k2x + 2 * k3x + k4x);
  y += (dt / 6) * (k1y + 2 * k2y + 2 * k3y + k4y);
  z += (dt / 6) * (k1z + 2 * k2z + 2 * k3z + k4z);
  ta += dt;  // Incrementar el tiempo acumulado
}

// Modelo mecanicista que modela la dinámica del sistema
void systemDynamics(float x, float y, float z, float &dx, float &dy, float &dz) {
  // Ecuaciones diferenciales del modelo
  dx = ((p1 * x * y) / (p2 + y)) - (p3 * x * z) - (p4 * x);
  dy = -(p5 * x * y) - (p6 * y * z) - (p7 * y);
  dz = (p8 * x * z) + (p9 * y * z) - (p10 * z);
}
