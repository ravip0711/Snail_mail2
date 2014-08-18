get '/users/:email_address/emails' do
  m = Mail.new(params[:email_address])
  if m.status == "200"
    m.messages.to_json
  elsif m.status == "404"
    status 404
    "your link is bad"
  elsif m.status == "429"
    status 429
  elsif m.status == "502"
    status 502
  else
    "Status UNKOWN"
  end
end


# talk to api
#   response.body
#   resppnse.status_code # 404

