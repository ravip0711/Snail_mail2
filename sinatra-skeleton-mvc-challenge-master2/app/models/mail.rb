require 'nokogiri'
require 'open-uri'
require 'net/http'

class Mail

  def self.parse_mail(email)
    url = "http://dbc-mail.herokuapp.com/api/" + email + "/messages?api_token=1897625d93303cf90c957461eb1924d4"
    uri = URI(url)
    http_request = Net::HTTP.get_response(uri)
    if http_request.code == "200"
      fetched_XML = Nokogiri::XML(open(url))
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
    elsif http_request.code = "502"
      # status 502
      "HELLO DUDE"
    else
      "HELLO"
    end
  end

end

mail = Mail.parse_mail("bob@example.com")
puts mail
