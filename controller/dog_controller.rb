class DogController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = "Dog Homepage"
    erb :"dogs/home"
  end

  get "/dogs" do
    @title = "Dog Pictures"
    @dogs = Post.all
    erb :'dogs/index'
  end

  get "/dogs/" do
    @title = "Dog Pictures"
    @dogs = Post.all
    erb :'dogs/index'
  end

  get "/dogs/new" do
    @dog = Post.new
    erb :'dogs/new'
  end

  get "/dogs/:id" do
    id = params[:id].to_i
    @dog = Post.find(id)
    erb :'dogs/show'
  end

  get "/info" do
    erb :"dogs/info"
  end

  post '/dogs' do

    dog = Post.new
    dog.title = params[:title]
    dog.body = params[:body]
    dog.image = params[:image]

    dog.save

    redirect "/dogs/"
  end

  post '/dogs/' do

    dog = Post.new
    dog.title = params[:title]
    dog.body = params[:body]
    dog.image = params[:image]

    dog.save

    redirect "/dogs/"
  end

  put "/dogs/:id" do

    id = params[:id].to_i

    dog=Post.find(id)

    dog.title = params[:title]
    dog.body = params[:body]
    dog.image = params[:image]

    dog.save

    redirect '/dogs/'

  end

  delete '/dogs/:id' do

    id=params[:id].to_i
    Post.destroy(id)
    redirect '/dogs'
  end

  get '/dogs/:id/edit' do
    id = params[:id].to_i
    @dog = Post.find(id)
    erb :'dogs/edit'
  end

end
