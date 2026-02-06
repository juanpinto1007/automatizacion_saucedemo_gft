import { When, Then } from "@cucumber/cucumber";
import { CustomWorld } from "../support/world";
import { InventoryPage } from "../pages/inventory.page";
import { CartPage } from "../pages/cart.page";
import { CheckoutPage } from "../pages/checkout.page";

When("agrego el producto {string} al carrito", async function (this: CustomWorld, producto: string) {
  const inventory = new InventoryPage(this.page);
  await inventory.agregarProductoAlCarrito(producto);
});

When("voy al carrito", async function (this: CustomWorld) {
  const inventory = new InventoryPage(this.page);
  await inventory.irAlCarrito();
});

When(
  "realizo el checkout con nombre {string} apellido {string} y codigo postal {string}",
  async function (this: CustomWorld, nombre: string, apellido: string, codigoPostal: string) {
    const cart = new CartPage(this.page);
    await cart.iniciarCheckout();

    const checkout = new CheckoutPage(this.page);
    await checkout.diligenciarInformacion(nombre, apellido, codigoPostal);
    await checkout.finalizarCompra();
  }
);

Then("debo ver la confirmacion de compra", async function (this: CustomWorld) {
  const checkout = new CheckoutPage(this.page);
  await checkout.validarConfirmacion();
});
