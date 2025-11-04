import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab-url"
// tabs should have data-tab-name attribute to identify how to set the URL
export default class extends Controller {

  updateUrl(event) {
    const tabName = event.target.dataset.tabName;

    // Update URL without reloading the page
    const url = new URL(window.location);
    url.searchParams.set('tab', tabName);
    window.history.pushState({}, '', url);
  }
}
