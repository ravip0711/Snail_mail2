require 'nokogiri'
require 'open-uri'
require 'net/http'

class Mail

  def initialize(email)
    @email = email
    make_request
  end

  def make_request
    url = "http://dbc-mail.herokuapp.com/api/" + @email + "/messages?api_token=1897625d93303cf90c957461eb1924d4"
    uri = URI(url)
    @response = Net::HTTP.get_response(uri)
  end

  def status
    @response.code
  end

  def messages
    fetched_XML = Nokogiri::XML(@response.body)
    array_of_messages = []
    fetched_XML.xpath("//message").each do |message|
      array_of_messages << {
        id: message.search("id").children.text,
        from: message.search("from").children.text,
        subject: message.search("subject").children.text,
        from: message.search("from").children.text,
        body: message.search("body").children.text
      }
    end
    array_of_messages
  end

end

# mail = Mail.parse_mail("bob@example.com")
# puts mail
