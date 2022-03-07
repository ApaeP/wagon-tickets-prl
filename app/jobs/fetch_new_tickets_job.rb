class FetchNewTicketsJob < ApplicationJob

  def perform(batch_number)
    # block that will be retried in case of failure
    url = "https://kitt.lewagon.com/api/v1/camps/#{827}/tickets"
    cookie = ENV.fetch("COOKIE")

    response = RestClient.get(url, cookie: cookie)
    response = JSON.parse(response.body)

    puts "\n\n\n\n#{response}\n\n\n\n\n"
    # binding.pry

    response = JSON.parse(File.read('public/fake_data/four_tickets_827_json.json'))
    new_tickets = response["tickets"]

    new_tickets.each do |tckt|
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
