# Taller de splines

## Propósito

Estudiar algunos tipos de curvas paramétricas y sus propiedades.

## Tarea

Implemente las curvas cúbicas naturales, de Hermite y Bezier (cúbica y de grado 7), de acuerdo a las indicaciones del sketch adjunto.

*Sugerencia:* Como las curvas de Hermite y cúbica de Bezier requieren varias secciones, reacomode los puntos de control para que su continuidad sea C<sup>1</sup>. Ver [acá](https://visualcomputing.github.io/Curves/#/5/5) y [propiedad 4 de acá](https://visualcomputing.github.io/Curves/#/6/4).

## Profundización

Represente los _boids_ del [FlockOfBoids](https://github.com/VisualComputing/framesjs/tree/processing/examples/Advanced/FlockOfBoids) mediante superficies de spline.

## Integrantes

Máximo 3.

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|Carlos A Lopez R|caralopezromUN|
|Degly S Pava P  |DglyP         |

## Conclusiones

* Una curva puede ser una linea recta si y solo si todos los puntos de control son colineales

* Una curva de Bezier puede ser separada en dos curvas independientes y estas siguen siendo curvas de Bezier

* Mediante la utilización de un algoritmo para construir y justificar una curva de bezier, resulta una curva con las propiedades de un spline y de un bezier

## Referencias
* Splines :http://www.inf-cr.uclm.es/www/cglez/downloads/docencia/AC/splines.pdf

* caso 0 :https://es.wikipedia.org/wiki/Curva_de_B%C3%A9zier

* caso 1 : https://blog.demofox.org/2015/08/08/cubic-hermite-interpolation/

* caso 2 :https://www.geeksforgeeks.org/cubic-bezier-curve-implementation-in-c/

* caso 3 :https://www.math.ntnu.no/emner/TMA4215/2008h/cubicsplines.pdf

## Entrega

* Modo de entrega: Haga [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla e informe la url del repo en la hoja *urls* de la plantilla compartida (una sola vez por grupo). Plazo: 6/5/18 a las 24h.
