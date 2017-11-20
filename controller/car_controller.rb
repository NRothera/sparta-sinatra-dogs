class CarController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get "/car" do

    @title = "Car Homepage"
    @cars = Car.all
    erb :"cars/index"

  end

  get "/car/:id" do
    id = params[:id].to_i
    @cars = Car.find(id)
    erb :'cars/show'
  end
end
