import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submit" ]

  connect() {
  }
  submit() {
    setTimeout(() => this.submitTarget.click(), 50);
  }
}
