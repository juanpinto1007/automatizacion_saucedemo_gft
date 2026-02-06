import { Page, expect } from "@playwright/test";

export class CheckoutPage {
  constructor(private readonly page: Page) {}

  async diligenciarInformacion(nombre: string, apellido: string, codigoPostal: string): Promise<void> {
    await this.page.locator('[data-test="firstName"]').fill(nombre);
    await this.page.locator('[data-test="lastName"]').fill(apellido);
    await this.page.locator('[data-test="postalCode"]').fill(codigoPostal);
    await this.page.locator('[data-test="continue"]').click();
    await expect(this.page).toHaveURL(/checkout-step-two\.html/);
  }

  async finalizarCompra(): Promise<void> {
    await this.page.locator('[data-test="finish"]').click();
    await expect(this.page).toHaveURL(/checkout-complete\.html/);
  }

  async validarConfirmacion(): Promise<void> {
    await expect(this.page.locator(".complete-header")).toHaveText("Thank you for your order!");
  }
}
