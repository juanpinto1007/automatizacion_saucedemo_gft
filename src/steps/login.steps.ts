import { Given, When, Then } from "@cucumber/cucumber";
import { CustomWorld } from "../support/world";
import { LoginPage } from "../pages/login.page";
import { InventoryPage } from "../pages/inventory.page";

Given("que ingreso a SauceDemo", async function (this: CustomWorld) {
  const loginPage = new LoginPage(this.page);
  await loginPage.abrir();
});

When(
  "inicio sesion con usuario {string} y clave {string}",
  async function (this: CustomWorld, usuario: string, clave: string) {
    const loginPage = new LoginPage(this.page);
    await loginPage.iniciarSesion(usuario, clave);
  }
);

Then(
  "debo ver el mensaje de error exacto {string}",
  async function (this: CustomWorld, mensajeEsperado: string) {
    const loginPage = new LoginPage(this.page);
    await loginPage.validarMensajeErrorExacto(mensajeEsperado);
  }
);

Then("debo ver el inventario", async function (this: CustomWorld) {
  const inventoryPage = new InventoryPage(this.page);
  await inventoryPage.validarInventario();
});
