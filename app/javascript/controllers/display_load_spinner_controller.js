import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-load-spinner"
export default class extends Controller {
  static targets = ['spinner', 'content', 'text']

  spin() {
    this.contentTarget.classList.add("d-none")
    this.spinnerTarget.classList.remove("d-none")
    this.textTarget.classList.remove("d-none")
    this.element.classList.add("center-spinner")
  }
}
