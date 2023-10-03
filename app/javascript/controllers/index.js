// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
import OcrController from "./ocr_controller"
application.register("ocr", OcrController)

import MapController from "./map_controller"
application.register("map", MapController)

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address_autocomplete", AddressAutocompleteController)
