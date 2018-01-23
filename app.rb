require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
# get "/" do 
#     "Ahoy"
# end

# Respond to incoming calls with a simple text message
get '/sms' do
    "so i see somthing"
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message body: 'The Robots are coming! Head for the hills!'
    end
  
    content_type 'text/xml'
  
    twiml.to_s
  end