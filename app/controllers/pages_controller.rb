class PagesController < ApplicationController
  def home
    # Batch.all.each(&:fetch_tickets)
    @tickets = Ticket.includes(:student).all
  end
end
