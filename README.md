

# Sensor virtual para la estimación de concentración de etanol en fermentación continua

## Autor
Fabián González Morales
Departamento de Ingeniería Eléctrica y Electrónica, Tecnológico Nacional de México/IT Tijuana, Blvd. Alberto Limón Padilla s/n, Tijuana, C.P. 22454, B.C., México. Email: fabian.gonzalez193@tectijuana.edu.mx
## Asignaturas o departmento donde se puede usar la Actividad
Modelado de Sistemas Biológicos e Ingeniería de Control de Procesos en Ingeniería Biomédica e Ingeniería Química.

## Información general
El modelado de sistemas biológicos es una herramienta esencial en la ingeniería, ya que permite describir matemáticamente el comportamiento de organismos vivos bajo condiciones específicas. En este proyecto, se implementa un sensor virtual basado en un modelo mecanicista para estimar la producción de etanol durante el proceso de fermentación continua utilizando la levadura Kluyveromyces marxianus (K. marxianus).

La estimación en tiempo real de la concentración de etanol es fundamental en la industria vinícola para garantizar la calidad del producto y optimizar el proceso de producción. Este proyecto aborda esta necesidad mediante la implementación de un modelo mecanicista, resuelto numéricamente en microcontroladores Arduino, que simula y estima la dinámica del crecimiento de biomasa, el consumo de glucosa y la producción de etanol.

La actividad tiene como objetivo aportar al perfil del ingeniero la capacidad de desarrollar herramientas computacionales para la monitorización y control de procesos biotecnológicos, integrando conocimientos de biología de sistemas, ingeniería de control, y electrónica aplicada.

## Objetivo general
Desarrollar un sensor virtual para la solución del problema de estimación de la producción de etanol en fermentación continua.  

## Descripción detallada del sistema
El sistema implementado consiste en dos programas ejecutados en microcontroladores Arduino Uno y Mega, denominados TX (transmisor) y RX (receptor), que interactúan para simular y estimar el comportamiento de la fermentación continua de K. marxianus. El programa TX modela el comportamiento real del sistema, generando datos simulados de la biomasa, mientras que RX actúa como sensor virtual, recibiendo estos datos y estimando las variables de estado del sistema.

El proceso se basa en el modelo mecanicista previamente desarrollado, que describe las tasas de las concentraciones de biomasa, glucosa y etanol mediante un conjunto de ecuaciones diferenciales ordinarias de primer orden, acopladas no lineales. Estas ecuaciones son resueltas utilizando el método de Runge-Kutta de cuarto orden.

La comunicación entre los dispositivos se realiza a través de un puerto serial configurado a 57600 baudios. Los datos generados se almacenan en archivos CSV que posteriormente se pueden procesar y analizar en herramientas como MATLAB para evaluar la convergencia del sensor virtual utilizando métricas como el error medio absoluto (MAE), la raíz del error cuadrático medio (RMSE) y el coeficiente de determinación (R²).

El desarrollo de este sensor virtual representa una alternativa eficiente para superar las limitaciones de los métodos tradicionales de medición de etanol, que suelen implicar largos tiempos de espera y costos elevados en la industria vinícola.

## Referencias principales
[1] Y. Salazar, P. A. Valle, E. Rodríguez, N. O. Soto-Cruz, J. B. Páez-Lerma y F. J. Reyes-Sánchez, "Mechanistic Modelling of Biomass Growth, Glucose Consumption and Ethanol Production by Kluyveromyces marxianus in Batch Fermentation," Entropy, vol. 25, no. 3, p. 497, marzo 2023. DOI: https://doi.org/10.3390/e25030497.

[2] A. J. Vargas Rodríguez, "Implementación de un observador para la estimación de producción de etanol." [Consultado: 03 de junio de 2024].

[3] G. G. Fonseca, E. Heinzle, C. Wittmann, et al., "The yeast Kluyveromyces marxianus and its biotechnological potential," Applied Microbiology and Biotechnology, vol. 79, pp. 339–354, 2008. DOI: https://doi.org/10.1007/s00253-008-1458-6.

[4] M. Kano y K. Fujiwara, "Virtual Sensing Technology in Process Industries: Trends and Challenges Revealed by Recent Industrial Applications," Journal of Chemical Engineering of Japan, vol. 46, no. 1, pp. 1–17, 2013. DOI: https://doi.org/10.1252/jcej.12we167.

[5] Y.-H. Du, M.-Y. Wang, L.-H. Yang, L.-L. Tong, D.-S. Guo y X.-J. Ji, "Optimization and Scale-Up of Fermentation Processes Driven by Models," Bioengineering, vol. 9, no. 9, p. 473, 2022. DOI: https://doi.org/10.3390/bioengineering9090473.