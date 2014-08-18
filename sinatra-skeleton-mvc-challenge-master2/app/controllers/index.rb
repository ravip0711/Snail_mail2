get '/users/:email_address/emails' do
  if Mail.parse_mail(params[:email_address])
end


# talk to api
#   response.body
#   resppnse.status_code # 404

