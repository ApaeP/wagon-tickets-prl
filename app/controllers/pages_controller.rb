class PagesController < ApplicationController
  def home
    @tickets = Ticket.includes(:student).all
  end
end
