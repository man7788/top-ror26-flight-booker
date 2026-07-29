import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  static targets = ['form', 'button'];

  show() {
    const temp = document.getElementById('passenger-form');
    this.formTarget.append(temp.content.cloneNode(true));
    this.buttonTarget.hidden = true;
  }
}
