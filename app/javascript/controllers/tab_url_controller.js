import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab-url"
// add event listeners to tab buttons to update URL on tab change
// tabs should have data-tab-name attribute to identify how to set the URL
export default class extends Controller {
  connect() {
    const tabButtons = this.element.querySelectorAll('button[data-tab-name]');

    tabButtons.forEach(button => {
      button.addEventListener('shown.bs.tab', this.updateUrl.bind(this));
    });
  }

  updateUrl(event) {
    const tabName = event.target.dataset.tabName;

    // Update URL without reloading the page
    const url = new URL(window.location);
    url.searchParams.set('tab', tabName);
    window.history.pushState({}, '', url);
  }
}
