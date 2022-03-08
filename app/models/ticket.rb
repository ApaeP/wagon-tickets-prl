class Ticket < ApplicationRecord
  belongs_to  :student
  has_many    :votes, dependent: :destroy

  delegate :batch, to: :student

  def update_score
    # update_column(:score, votes.pluck(:value).sum)
    score = (s = votes.pluck(:value).sum) <= 0 ? 0 : s

    update(score: score)
  end
end
