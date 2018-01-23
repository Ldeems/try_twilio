require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
load './local_ENV.rb' if File.exist?('./local_ENV.rb')
get "/" do 
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    
    @message = @client.messages.create(
      from: twilio_number,
      to: to_number,
      body: 'they are behind you'
    )
    
    puts @message.status
end

# Respond to incoming calls with a simple text message
post '/sms' do
    "so i see somthing"
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message body: 'The Robots are coming! Head for the hills!'
    end
  
    content_type 'text/xml'
  
    twiml.to_s
  end

  
# set up a client to talk to the Twilio REST API