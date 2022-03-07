class Batch < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :tickets, -> { order created_at: :asc }, through: :students

  def fetch_tickets
    FetchNewTicketsJob.perform_async(number)
  end
end
