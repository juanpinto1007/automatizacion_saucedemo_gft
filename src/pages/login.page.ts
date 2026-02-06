import { Page, expect } from "@playwright/test";

export class LoginPage {
  constructor(private readonly page: Page) {}

  private readonly inputUsuario = this.page.locator('[data-test="username"]');
  private readonly inputClave = this.page.locator('[data-test="password"]');
  private readonly btnLogin = this.page.locator('[data-test="login-button"]');
  private readonly lblError = this.page.locator('[data-test="error"]');

  async abrir(): Promise<void> {
    await this.page.goto("https://www.saucedemo.com/");
  }

  async iniciarSesion(usuario: string, clave: string): Promise<void> {
    await this.inputUsuario.fill(usuario);
    await this.inputClave.fill(clave);
    await this.btnLogin.click();
  }

  async validarMensajeErrorExacto(mensajeEsperado: string): Promise<void> {
    await expect(this.lblError).toHaveText(mensajeEsperado);
  }
}
