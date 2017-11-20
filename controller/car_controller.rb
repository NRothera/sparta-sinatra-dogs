class CarController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get "/cars" do

    @title = "Car Homepage"
    @cars = Car.all
    erb :"cars/index"

  end

  get "/cars/new" do
    @cars = Car.new
    erb :'cars/new'
  end

  get "/cars/:id" do
    id = params[:id].to_i
    @cars = Car.find(id)
    erb :'cars/show'
  end

  post '/cars/' do
    cars = Car.new
    cars.title = params[:title]
    cars.body = params[:body]
    cars.image = params[:image]

    cars.save
    redirect "/cars"
  end

  put "/cars/:id" do
    id = params[:id].to_i
    cars = Car.find(id)
    cars.title = params[:title]
    cars.body = params[:body]
    cars.image = params[:image]

    cars.save

    redirect '/cars'
  end

  delete '/cars/:id' do
    id=params[:id].to_i
    Car.destroy(id)
    redirect '/cars'

  end

  get '/cars/:id/edit' do
    id = params[:id].to_i
    @cars = Car.find(id)
    erb :'cars/edit'

  end
end
