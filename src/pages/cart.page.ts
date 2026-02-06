import { Page, expect } from "@playwright/test";

export class CartPage {
  constructor(private readonly page: Page) {}

  async validarProductoEnCarrito(nombreProducto: string): Promise<void> {
    await expect(this.page.locator(".inventory_item_name", { hasText: nombreProducto })).toBeVisible();
  }

  async iniciarCheckout(): Promise<void> {
    await this.page.locator('[data-test="checkout"]').click();
    await expect(this.page).toHaveURL(/checkout-step-one\.html/);
  }
}
