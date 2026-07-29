import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  static targets = ['passenger', 'form'];

  initialize() {
    if (this.passengerTargets.length === 1) {
      this.formTargets[0].hidden = true;
    }
  }

  passengerTargetConnected() {
    if (this.passengerTargets.length > 1) {
      this.formTargets.forEach((p) => {
        p.hidden = false;
      });
    }
  }

  passengerTargetDisconnected() {
    if (this.passengerTargets.length === 1) {
      this.formTargets[0].hidden = true;
    }
  }
}
