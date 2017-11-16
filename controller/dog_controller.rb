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
    @dogs = $dogs
    erb :'dogs/index'
  end

  get "/dogs/new" do

    erb :'dogs/new'

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
