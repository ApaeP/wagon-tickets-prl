import { Controller } from "stimulus"
import { csrfToken }  from "@rails/ujs";
import Rails          from "@rails/ujs"

export default class extends Controller {
  static targets = [ "score" ]
  static values = { ticketId: Number }

  upvote() {
    this._vote(1)
  }

  downvote() {
    this._vote(-1)
  }

  _vote(value) {
    const data = new FormData()
    data.append('vote[value]', value)

    Rails.ajax({
      url: `/tickets/${this.ticketIdValue}/votes`,
      type: 'post',
      data: data,
      success: function(data) {
        console.log(data.score)
        this._updateScore(data.score)
      }.bind(this),
      error: function(data) {
        console.log(data)
      }
    })
  }

  _updateScore(new_score) {
    this.scoreTarget.innerText = new_score
  }
}
