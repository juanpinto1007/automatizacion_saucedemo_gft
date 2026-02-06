import { Before, After, Status, setDefaultTimeout } from "@cucumber/cucumber";
import fs from "fs";
import path from "path";
import { CustomWorld } from "./world";

// Timeout global por step: evita cortes de 5s del runtime de Cucumber
setDefaultTimeout(120000);

const ensureDir = (dir: string) => {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
};

const sanitize = (name: string) =>
  name.replace(/[^\w\d-_]+/g, "_").slice(0, 150);

Before(async function (this: CustomWorld) {
  ensureDir("reports/screenshots");
  ensureDir("reports/videos");
  await this.init();
});

After(async function (this: CustomWorld, scenario) {
  try {
    if (scenario.result?.status === Status.FAILED && this.page) {
      const file = path.join("reports/screenshots", `${sanitize(scenario.pickle.name)}.png`);
      await this.page.screenshot({ path: file, fullPage: true });
    }
  } finally {
    await this.dispose();
  }
});
