class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

    get '/messages' do
        messages = Message.all
        messages.order(:created_at)
        messages.to_json
    end

    post '/messages' do
      message = Message.create(
        username: params[:username],
        body: params[:body]
      )
      message.to_json
    end

end
