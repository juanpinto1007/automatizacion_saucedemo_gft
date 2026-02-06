# language: es

Característica: Login en SauceDemo

  @negative @regression
  Escenario: Login fallido con usuario bloqueado
    Dado que ingreso a SauceDemo
    Cuando inicio sesion con usuario "locked_out_user" y clave "secret_sauce"
    Entonces debo ver el mensaje de error exacto "Epic sadface: Sorry, this user has been locked out."


  @regression
  Esquema del escenario: Login exitoso con multiples usuarios
  Dado que ingreso a SauceDemo
  Cuando inicio sesion con usuario "<user>" y clave "secret_sauce"
  Entonces debo ver el inventario

  Ejemplos:
  | user                    |
  | standard_user           |
  | problem_user            |
  | performance_glitch_user |