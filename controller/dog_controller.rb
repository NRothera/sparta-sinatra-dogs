class DogController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $angry_dogs = [{
    id:0,
    title: "ohh nooo he's angry",
    body: "He's going to get you!",
    image: "http://doggroomeradvice.com/wp-content/uploads/2012/03/angry-dog-300x300.jpg"
    },
    {
    id: 1,
    title: "This one's upset too!",
    body: "better give him a treat",
    image: "https://i.pinimg.com/736x/15/1f/47/151f470bcc9e668264d71460fdb872cf--funny-humor-funny-dogs.jpg"
      }]

  get "/" do
    @title = "Dog Homepage"


    erb :"dogs/home"
  end

  get "/dogs" do
    @title = "Dog Pictures"
    @dogs = Post.all
    erb :'dogs/index'
  end

  post '/dogs' do

    dog = Post.new
    dog.title = params[:title]
    dog.body = params[:body]
    dog.image = params[:image]

    dog.save

    redirect "/"
  end

  get "/dogs/new" do
    @dog = Post.new
    erb :'dogs/new'
  end

  post '/dogs' do

    post = Post.new

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect "/"
  end

  get "/dogs/angry" do
    @title = "Angry dogs"
    @angry_dog = $angry_dogs
    erb :'angry_dogs/index'
  end

  get "/dogs/angry/new" do
    @title = "New Dog"
    erb :'angry_dogs/new'
  end

  get "/angry_dogs/:id" do
    id = params[:id].to_i
    @angry_dog = $angry_dogs[id]
    erb :'angry_dogs/show'
  end

  get "/dogs/:id" do
    id = params[:id].to_i
    @dog = Post.find(id)
    erb :'dogs/show'
  end

  put "/dogs/:id" do

    id = params[:id].to_i

    dog=Post.find(id)

    dog.title = params[:title]
    dog.body = params[:body]
    dog.image = params[:image]

    dog.save

    redirect '/'

  end

  get '/dogs/:id/edit' do
    id = params[:id].to_i
    @dog = Post.find(id)
    erb :'dogs/edit'
  end

  delete '/dogs/:id' do

    id=params[:id].to_i
    Post.destroy(id)
    redirect '/'
  end

end
