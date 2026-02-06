module.exports = {
  default: {
    require: [
      "src/support/world.ts",
      "src/support/hooks.ts",
      "src/steps/**/*.ts"
    ],
    requireModule: ["ts-node/register"],
    format: [
      "progress",
      "json:reports/cucumber-report.json"
    ],
    paths: ["features/**/*.feature"],
    parallel: 1
  }
};
