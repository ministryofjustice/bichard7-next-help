document.body.className +=
  " js-enabled" +
  ("noModule" in HTMLScriptElement.prototype
    ? " govuk-frontend-supported"
    : "");

import { initAll } from "./govuk/govuk-frontend-5.9.0.min.js";

initAll();
