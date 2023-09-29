# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "tesseract.js", to: "https://ga.jspm.io/npm:tesseract.js@4.1.2/src/index.js"
pin "#src/worker/node/index.js", to: "https://ga.jspm.io/npm:tesseract.js@4.1.2/src/worker/browser/index.js"
pin "is-electron", to: "https://ga.jspm.io/npm:is-electron@2.2.2/index.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
pin "regenerator-runtime/runtime", to: "https://ga.jspm.io/npm:regenerator-runtime@0.13.11/runtime.js"
pin "openai", to: "https://ga.jspm.io/npm:openai@4.10.0/index.mjs"
pin "openai/_shims/auto/runtime", to: "https://ga.jspm.io/npm:openai@4.10.0/_shims/auto/runtime.mjs"
pin "openai/core", to: "https://ga.jspm.io/npm:openai@4.10.0/core.mjs"
pin "openai/error", to: "https://ga.jspm.io/npm:openai@4.10.0/error.mjs"
pin "openai/pagination", to: "https://ga.jspm.io/npm:openai@4.10.0/pagination.mjs"
pin "openai/resource", to: "https://ga.jspm.io/npm:openai@4.10.0/resource.mjs"
