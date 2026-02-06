import { setWorldConstructor, World, IWorldOptions } from "@cucumber/cucumber";
import { Browser, BrowserContext, Page, chromium } from "@playwright/test";

export class CustomWorld extends World {
  browser!: Browser;
  context!: BrowserContext;
  page!: Page;

  constructor(options: IWorldOptions) {
    super(options);
  }

  async init() {
    this.browser = await chromium.launch({ headless: true });

    this.context = await this.browser.newContext({
      recordVideo: { dir: "reports/videos" }
    });

    this.page = await this.context.newPage();

    this.page.setDefaultTimeout(30000);
    this.page.setDefaultNavigationTimeout(30000);
  }

  async dispose() {
    await this.context?.close();
    await this.browser?.close();
  }
}

setWorldConstructor(CustomWorld);
