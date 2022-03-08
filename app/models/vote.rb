class Vote < ApplicationRecord
  belongs_to :ticket

  validate :prevent_negative_ticket_score
  after_update :update_ticket_score_on_update
  before_destroy :update_ticket_score

  private

  def update_ticket_score_on_update
    return if value_previously_was == value

    update_ticket_score
  end

  def update_ticket_score
    ticket.update_score
  end

  def prevent_negative_ticket_score
    return if value == 1 || value == -1 && ticket.score > 0

    errors.add(:value, "Cannot downvote a ticket with a score <= 0")
  end
end
