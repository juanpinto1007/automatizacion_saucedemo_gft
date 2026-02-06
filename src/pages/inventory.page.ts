import { Page, expect } from "@playwright/test";

export class InventoryPage {
  constructor(private readonly page: Page) {}

  private readonly titulo = this.page.locator(".title");

  async validarInventario(): Promise<void> {
    // redirección
    await expect(this.page).toHaveURL(/inventory\.html/);
    await expect(this.titulo).toHaveText("Products");
  }
    private productoPorNombre(nombre: string) {
      return this.page.locator(".inventory_item").filter({
        has: this.page.locator(".inventory_item_name", { hasText: nombre })
      });
    }

    async agregarProductoAlCarrito(nombreProducto: string): Promise<void> {
      const item = this.productoPorNombre(nombreProducto);
      await item.locator("button:has-text('Add to cart')").click();
    }

    async irAlCarrito(): Promise<void> {
      await this.page.locator(".shopping_cart_link").click();
      await expect(this.page).toHaveURL(/cart\.html/);
    }

}
