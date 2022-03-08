class VotesController < ApplicationController
  before_action :set_ticket, only: %i[create]

  def create
    vote = Vote.find_or_create_by(
      session_id: session[:session_id],
      ticket: @ticket
    )
    if vote.update(vote_params)
      render json: { score: vote.ticket.score }
    else
      render json: {
        score: vote.ticket.score,
        errors: vote.errors.full_messages.join(', ')
      }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def vote_params
    params.require(:vote).permit(:value)
  end
end
