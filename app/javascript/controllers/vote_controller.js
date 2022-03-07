import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [  ]
  static values = { ticketId: Number }

  connect() {
    console.log(this.ticketIdValue)
  }
}
