require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
load './local_ENV.rb' if File.exist?('./local_ENV.rb')
get '/' do
    erb :page_one
end    

post "/send" do 
    message = params[:message]
    @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
    
    @message = @client.messages.create(
      from: ENV['twilio_number'],
      to: ENV['to_number'],
      body: message
      media_url: 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg'
    )
    
    puts @message.status
    redirect '/'
end

# Respond to incoming calls with a simple text message
# 2

  
# set up a client to talk to the Twilio REST API