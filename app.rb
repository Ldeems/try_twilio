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
    )
    
    puts @message.status
    redirect '/'
end
