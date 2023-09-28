import { Controller } from "stimulus";

export default class extends Controller {
  clearSearch(event) {
    event.preventDefault();
    const searchInput = this.element.querySelector("#search-form");
    searchInput.value = "";
    this.element.submit();
  }
}
