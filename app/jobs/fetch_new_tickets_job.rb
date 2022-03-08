class FetchNewTicketsJob < ApplicationJob

  def perform(batch_number)
    @batch_number = batch_number

    fetch_data
    create_tickets
  end

  private

  def fetch_data
    url       = "https://kitt.lewagon.com/api/v1/camps/#{@batch_number}/tickets"
    cookie    = ENV.fetch("KITT_COOKIE")
    request   = RestClient.get(url, cookie: cookie)
    @response = JSON.parse(request.body)
  end

  def create_tickets
    tickets = @response["tickets"]
    tickets.each do |tckt|
      Ticket.find_or_create_by(
        content: tckt["content"],
        student: Student.find_or_create_by(
          name: tckt['user']['name'],
          kitt_id: tckt['user']['id'],
          avatar_url: tckt['user']['avatar_url'],
          batch: Batch.find_or_create_by(number: batch_number)
        )
      )
    end
  end
end
