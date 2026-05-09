#import "@preview/cetz:0.5.0"
#import "@preview/cetz-plot:0.1.3"
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  header: align(right, text(8pt, style: "italic")[Memorias sobre transformadas])
  )

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "es"
)

#show heading: set block(above: 1.4em, below: 1em)
#set par(justify: true, leading: 0.65em)

#align(center)[
  #block(text(weight: 700, 1.75em)[Memorias de clase])
  #v(1em)
  #text(1.2em)[Autores: \ Sebastián Prieto Rivero \
  Juan Sebastian Vanegas Trejos]
]

#line(length: 100%)
#outline(indent: 2em)
#pagebreak()

= Transformada Z

Ya conocemos la transformada de Fourier, que nos permite hacer una descomposicion de una función en terminos de series de senos y cosenos.

$ F(omega) = integral_(-infinity)^(infinity) f(t) e^(-i omega t) d t $

Pero esto solo es valido si $f(t)$ es continua. Existe entonces una transformda similar para funcines discretas, es la transformada Z:

$ F(omega) = sum_(k=-infinity)^(infinity) f(k) e^(-i omega k)\
  text("Siempre y cuando") f(k) text("Sea una función discreta y la serie converja") $

si $z = e^(i omega)$ se puede la serie, que convierte una apartir de la suma obtener una función analitica; conocidas como series de Laurent se puede ver como sigue y se enteinde por que se le llama transformada Z:

$ F(z) = sum_(k=-infinity)^(infinity) f(k) z^(-k) $

== Algunas transformadas simples

+ Si $f(k) = 1^k$ la transformada Z se observa es:

  $ Z(1^k) = sum_(k=-infinity)^(infinity) 1^k z^(-k) = sum_(k=-infinity)^(infinity) (z^(-1))^(k) \
  text("Serie que tiene forma de geometrica, por tanto solo converge para") abs(z) > 1\
  => sum_(k=-infinity)^(infinity) (z^(-1))^(k) = 1 / (1 - z^(-1)) z/z = z / (z - 1) = Z(1^k) $
+ Si $f(k) = a^k$ la transformada Z se observa es:

  $ Z(a^k) = sum_(k=-infinity)^(infinity) a^k z^(-k) = sum_(k=-infinity)^(infinity) (a z^(-1))^(k) \
  text("Serie que tiene forma de geometrica, por tanto solo converge para") abs(a z^(-1)) < 1\
  => sum_(k=-infinity)^(infinity) (a z^(-1))^(k) = 1 / (1 - a z^(-1)) z/z = z / (z - a) = Z(a^k) $
+ Si $f(k) = e^(alpha k)$ la transformada Z se observa es:

  $ Z(e^(alpha k)) = sum_(k=-infinity)^(infinity) e^(alpha k) z^(-k) = sum_(k=-infinity)^(infinity) (e^(alpha) z^(-1))^(k) \
  text("Serie que tiene forma de geometrica, por tanto solo converge para") abs(e^(alpha) z^(-1)) < 1\
  => sum_(k=-infinity)^(infinity) (e^(alpha) z^(-1))^(k) = 1 / (1 - e^(alpha) z^(-1)) z/z = z / (z - e^(alpha)) = Z(e^(alpha k)) $
+ Si $f(k) = delta(k -a)$ la transformada Z se observa es:

  $ Z(delta(k -a)) = sum_(k=-infinity)^(infinity) delta(k -a) z^(-k) = z^(-a) = Z(delta(k -a)) \
  text("Pués") delta(k - a) = cases(1 "si" k = a, 0 "si" k != a) "Entonces solo quda ese termino en la suma." $
  - Si $a = 0$ entonces podemos ver el caso particular de la función delta de Kronecker, $delta(k) = delta(k - 0)$, cuya transformada Z es:

    $ Z(delta(k)) = sum_(k=-infinity)^(infinity) delta(k) z^(-k) = z^0 = 1 $
+ Si $f(k) = k$ la transformada Z se observa es:

  $ Z(k) = sum_(k=-infinity)^(infinity) k z^(-k) = sum_(k=-infinity)^(infinity) k (z^(-1))^(k) \
  text("Serie que tiene forma de geometrica, por tanto solo converge para") abs(z^(-1)) < 1\
  => sum_(k=-infinity)^(infinity) k (z^(-1))^(k) = z / (z - 1)^2 = Z(k) $
= Propiedades de la transformada Z
+ Linealidad: 
  $ Z(a f(k) + b g(k)) = a Z(f(k)) + b Z(g(k)) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(f(k+m)) = z^(m) F(z) - z^m f(0) - z^(m-1) f(1) - ... - z f(m-1) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(f(k-m)) = z^(-m) F(z) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(e^(alpha k) f(k)) = F(z e^(-alpha)) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(a^k f(k)) = F(z/a) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(k f(k)) = -z d/ (d z) F(z) $

+ Si  $Z(f(k)) = F(z)$ entonces:
  $ Z(f(k)/k) = integral F(z) / z d z $

+ La convolución:
  $ Z(f(k) * g(k)) = Z(f(k)) Z(g(k)) $

== Uso de las propiedades para hallar transformadas Z más complejas

+ Si $f(k) = sin(a k)$ entoces se puede usar la formula de Euler para escribir $f(k)$ como:

  $ f(k) = (e^(i a k) - e^(-i a k)) / (2 i) $

  Luego usando la linealidad:

  $ Z(sin(a k)) = (Z(e^(i a k)) - Z(e^(-i a k))) / (2 i) = (z / (z - e^(i a)) - z / (z - e^(-i a))) / (2 i) \
  = 1/(2i)[ (z (e^(i a) - e^(-i a)))/(z^2 - 2 z (e^(i a) + e^(-i a)) + 1)] = (z sin(a))/(z^2 - 2 z cos(a) + 1) $

+ Si $f(k) = cos(a k)$ entoces se puede usar la formula de Euler para escribir $f(k)$ como:
  $ f(k) = (e^(i a k) + e^(-i a k)) / 2 $

  Luego usando la linealidad:

  $ Z(cos(a k)) = (Z(e^(i a k)) + Z(e^(-i a k))) / 2 = (z / (z - e^(i a)) + z / (z - e^(-i a))) / 2 \
  = 1/2[ (z(2z -(e^(i a) + e^(-i a))))/(z^2 - 2 z (e^(i a) + e^(-i a)) + 1)] = (z^2 - z cos(a))/(z^2 - 2 z cos(a) + 1) $

+ Si $f(k) = a^(k+1)$ entonces se puden utilizar las propiedades, conociendo que:
  $ Z(a^k) = z / (z - a) $

  Por lo que inmediatamente se puede decir que:

  $ Z(a^(k+1)) = z Z(a^k) - z (a^0) = z^2 / (z - a) - z  = (a z) /(z - a) $

+ Si $f(k) = e^(-alpha (k + 2))$, entonces se puden utilizar las propiedades, conociendo que:
  $ Z(e^(-alpha k)) = z / (z - e^(-alpha)) $

  Por lo que inmediatamente se puede decir que:

  $ Z(e^(-alpha (k + 2))) = z^2 Z(e^(-alpha k)) - z^2 - z e^(-alpha) = (z e^(-alpha)) / (z - e^(-alpha)) $

+ Si $f(k) = k^2$ entonces se puden utilizar las propiedades, conociendo que:
  $ Z(k) = z / (z - 1)^2 $

  Por lo que inmediatamente se puede decir que:

  $ Z(k^2) = -z d/ (d z) Z(k) = -z d/ (d z) (z / (z - 1)^2) = z(z+1)/((z-1)^3) $

+ Si, $ f(k) = (a^(k+1) - b^(k+1)) / (a - b) $ 

  se pueden utilizar la linealidad y conociendo que $Z(a^(k+1)) = z a/(z - a)$ entonces se llega a:

  $ Z(f(k)) = (z a/(z - a) - z b/(z - b))/(a - b) = z^2 / ((z - a)(z - b)) $

+ Sabiendo que $Z(e^-k) = z / (z - e^-1)$ se pueden obtener los siguientes resultados:

  - $ Z(e^(-(k-1))) = 1 / (z - e^-1) $
  - $ Z(e^(-(k-2))) = 1 / (z(z - e^-1)) $
  - $ Z(e^(-(k-3))) = 1 / (z^2(z - e^-1)) $
  - $ Z(e^(-(k-4))) = 1 / (z^3(z - e^-1)) $
  - $ Z(e^(-(k-n))) = 1 / (z^(n-1)(z - e^-1)) $

+ Como $Z(cos(pi k)) = Z(cos(pi k)) = (z^2 - z cos(pi))/(z^2 - 2 z cos(pi) + 1) = z / (z + 1)  $ entonces la transformada Z de $f(k) = e^k cos(pi k)$ es:

  - $ Z(e^k cos(pi k)) = z e^(-1) / (z e^(-1) + 1) $
  - $ Z(a^k cos(pi k)) = (z/a) / ((z/a) + 1) = z / (z + a) $

+ Para encontrar la transformada inversa de $F(z) = z^2 /((z-1)^2)$ se utiliza la propiedad de la convolución, pues:

  $ z^2/((z-1)^2) = z/(z-1) z/(z-1) $

  y como $ Z(1^k) = z/(z-1) $ entonces se puede decir que:

  $ Z(1^k * 1^k) = z^2/((z-1)^2) $

  Por lo que:
  $ Z^(-1)(z^2/((z-1)^2)) = 1^k * 1^k $

= Transformada Z para la solución de ecuaciones en diferencias

Suponga la ecuación en diferencias:

$ x(k+2) - x(k+1) + 0.25x(k) = U(k + 2) | x(0) = 0, x(1) = 2 $

donde $U(k)$ es la función escalón unitario, que es igual a 1 para $k >= 0$ y 0 para $k < 0$.

Se aplica la transformada Z a ambos lados de la ecuación, usando las propiedades de la transformada Z para obtener:

$ z^2X(z) - z^2x(0) - z x(1) - z X(z) + z x(0) + 0.25 X(z) = z^2 z/(z-1) - z^2 U(0) - z U(1) \

 z^2X(z) - z^2 - 2z  - z X(z) + z + 0.25 X(z) = z^2 z/(z-1) - z^2 - z \

 X(z) (z^2 - z + 0.25) = z^2 z/(z-1) \ 
 
 X(z)/z = z^2/((z-1)(z - 0.5)^2) \
 $

Con esta expresión se realizan fracciones parciales para poder tener las partes de la parte derecha de la ecuación, para establecer transformadas Z conocidas:

$ z^2/((z-1)(z - 0.5)^2) = a/(z-1) + b/(z - 0.5) + c/((z - 0.5)^2)\ $

Si $z = 1 => a = 4$, si $z = 0.5 => c = -0.5$, si $z = 0 => b = -3$

Por lo tanto:

$ z^2/((z-1)(z - 0.5)^2) = 4/(z-1) + (-3)/(z - 0.5) + (-0.5)/((z - 0.5)^2)\ $

Entonces:

$ X(z) = 4 z/(z-1) + (-3) z/(z - 0.5) + (-0.5) z/((z - 0.5)^2)\ $

Se aplican las transformadas Z inversas conocidas para cada término:

$ x(k) = 4  -3 (0.5)^k + Z^(-1)((-0.5) z/((z - 0.5)^2)) $

Veamos cual es la transformada Z inversa de $ (a z)/((z - a)^2)$, para esto se puede usar la propiedad de la derivada:

$ Z(k a^k) = -z d/ (d z) Z(a^k) \

(z a)/((z - a)^2) = -z d/ (d z) (z / (z - a)) \

=> Z^(-1)((a z)/((z - a)^2)) = k a^k \
$

Por lo tanto:

$ x(k) = 4  -3 (0.5)^k - k (0.5)^k $

= Tablas Resumen
#figure(
  table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: horizon,
    stroke: 0.5pt + gray,
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
    [*Función en el tiempo $f(k)$*], [*Transformada $Z(f(k)) = F(z)$*],
    [$1^k$], [$z / (z - 1)$],
    [$a^k$], [$z / (z - a)$],
    [$e^(alpha k)$], [$z / (z - e^alpha)$],
    [$delta(k - a)$], [$z^(-a)$],
    [$delta(k)$], [$1$],
    [$k$], [$z / (z - 1)^2$],
    [$sin(a k)$], [$(z sin(a)) / (z^2 - 2z cos(a) + 1)$],
    [$cos(a k)$], [$(z^2 - z cos(a)) / (z^2 - 2z cos(a) + 1)$],
    [$a^(k+1)$], [$(a z) / (z - a)$],
    [$e^(-alpha(k+2))$], [$(z e^(-alpha)) / (z - e^(-alpha))$],
    [$k^2$], [$(z(z+1)) / (z-1)^3$],
    [$(a^(k+1) - b^(k+1)) / (a - b)$], [$z^2 / ((z - a)(z - b))$],
    [$e^(-(k-n))$], [$1 / (z^(n-1)(z - e^(-1)))$],
    [$e^k cos(pi k)$], [$(z e^(-1)) / (z e^(-1) + 1)$],
    [$a^k cos(pi k)$], [$z / (z + a)$],
    [$1^k * 1^k$], [$z^2 / (z - 1)^2$],
    [$k a^k$], [$(a z) / (z - a)^2$],
  ),
  caption: [Transformadas Z de funciones comunes]
)


#v(1em)


#figure(
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: horizon,
    stroke: 0.5pt + gray,
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
    [*Propiedad*], [*Expresión Matemática*],
    [Linealidad], [$Z(a f(k) + b g(k)) = a Z(f(k)) + b Z(g(k))$],
    [Avance en el tiempo], [$Z(f(k+m)) = z^m F(z) - sum_(i=0)^(m-1) z^(m-i) f(i)$],
    [Retraso en el tiempo], [$Z(f(k-m)) = z^(-m) F(z)$],
    [Multiplicación por $e^(alpha k)$], [$Z(e^(alpha k) f(k)) = F(z e^(-alpha))$],
    [Multiplicación por $a^k$], [$Z(a^k f(k)) = F(z/a)$],
    [Multiplicación por $k$], [$Z(k f(k)) = -z d/(d z) F(z)$],
    [División por $k$], [$Z(f(k)/k) = integral F(z)/z d z$],
    [Convolución], [$Z(f(k) * g(k)) = Z(f(k)) Z(g(k))$],
  ),
  caption: [Propiedades de la transformada Z]
)
