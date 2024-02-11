require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/:name" do
    name = params[:name]
    "Hello #{name}!"
  end

  post "/:name" do
    request.body.rewind
    request_payload = request.body.read
    "Hello #{params[:name]}! #{request_payload}"
  end
end

Application.run!
