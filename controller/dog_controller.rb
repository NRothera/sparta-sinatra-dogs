class DogController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }


  configure :development do
    register Sinatra::Reloader
  end

  $dogs = [{
	 id: 0,
	 title: "Cute pupper",
	 body: "Pupper stares whimzically into the distance",
   image: "http://img.zergnet.com/731737_300.jpg"
},
{
    id: 1,
    title: "Fluffy pupper",
    body: "Souless dark eyes stare up at you",
    image: "http://media.dogaidsociety.com.s3-eu-west-1.amazonaws.com/IMG_0253-300x300.jpg"
}]

  get "/" do
    @title = "Dog Homepage"
    erb :"dogs/home"

  end

  get "/dogs" do
    @title = "Dog Pictures"
    @dogs = $dogs
    erb :'dogs/index'
  end

  get "/dogs/new" do

    erb :'dogs/new'

  end

  get "/dogs/angry" do
    @title = "Angry dogs"
    erb :'angry_dogs/index'

  end

  get "/dogs/angry/new" do
    @title = "New Dog"
    erb :'angry_dogs/new'
  end

  post "/dogs" do

    "Text"

  end

  get "/dogs/:id/edit" do
    "Text"

  end

  get "/dogs/:id" do

    id = params[:id].to_i

    @dog = $dogs[id]
    erb :'dogs/show'

  end

  put "/dogs/:id" do

    "update photo"

  end

  delete "/dogs/:id" do

    "delete photo"

  end


end
