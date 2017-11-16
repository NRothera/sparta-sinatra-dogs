class DogController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  

  configure :development do
    register Sinatra::Reloader
  end

  $dogs = [{
	 id: 0,
	 title: "Dog 1",
	 body: "This is the first Dog",
   image: "http://img.zergnet.com/731737_300.jpg"
},
{
    id: 1,
    title: "Dog 2",
    body: "This is the second dog",
    image: "http://media.dogaidsociety.com.s3-eu-west-1.amazonaws.com/IMG_0253-300x300.jpg"
},
{
    id: 2,
    title: "Click here for an angry dog",
    body: "Angry dog",
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

  post "/dogs" do

    "Text"

  end

  post "/dogs/angry" do
    "angry dog page"
  end

  get "/dogs/:id/edit" do
    "Text"

  end

  get "/dogs/:id" do

    "Text"

  end

  put "/dogs/:id" do

    "update photo"

  end

  delete "/dogs/:id" do

    "delete photo"

  end


end
