import { Page, expect } from "@playwright/test";

export class InventoryPage {
  constructor(private readonly page: Page) {}

  private readonly titulo = this.page.locator(".title");

  async validarInventario(): Promise<void> {
    // redirección
    await expect(this.page).toHaveURL(/inventory\.html/);
    await expect(this.titulo).toHaveText("Products");
  }
}
