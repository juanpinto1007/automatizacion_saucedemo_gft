# language: es

Característica: Checkout completo en SauceDemo

@smoke @critical
Escenario: Login valido + agregar producto + checkout hasta confirmacion
Dado que ingreso a SauceDemo
Cuando inicio sesion con usuario "standard_user" y clave "secret_sauce"
Y agrego el producto "Sauce Labs Backpack" al carrito
Y voy al carrito
Y realizo el checkout con nombre "Juan" apellido "Pinto" y codigo postal "130001"
Entonces debo ver la confirmacion de compra
