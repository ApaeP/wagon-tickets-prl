class Ticket < ApplicationRecord
  belongs_to :student
  delegate :batch, to: :student
end
