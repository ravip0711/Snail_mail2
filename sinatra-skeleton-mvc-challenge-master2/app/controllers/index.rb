get '/users/:email_address/emails' do
  m = Mail.new(params[:email_address])
  if m.status == "200"
   user = User.create(email: params[:email_address])
    m.messages.each do |message|
      Email.create(user_id: user.id, subject: message[:subject], from: message[:from], body: message[:body], time_recieved: message[:time_recieved])
    end
    # trying to limit
    # user.emails.order(time_recieved: :desc).limit(200).to_json
  elsif m.status == "404"
    status 404
    "email address doesn't exist"
  elsif m.status == "429"
    status 429
    "you're making too many requests"
  elsif m.status == "502"
    status 502
    "internal error"
  else
    "Status UNKOWN"
  end
end




