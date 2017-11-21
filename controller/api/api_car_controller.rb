class ApiCarController < Sinatra::Base

  get '/api/cars' do

    @cars = Car.all

    content_type :json

    carArray = []

    @cars.each do |car|
      carHash = {
        "id" => car.id,
        "title" => car.title,
        "body" => car.body,
        "image" => car.image
      }
      carArray.push(carHash)
    end
    carArray.to_json

  end

  get '/api/dog_info' do

    dogArray = []

    @dog = HTTP.get('https://dog.ceo/api/breeds/image/random').to_s
    puts @dog

    @dog.each do |dogs|
      dogHash = {
        "status" => dogs.status,
        "message" => dogs.message
        }
      dogArray.push(dogHash)
    end
    dogArray.to_json
  end

  get '/api/cars/:id' do

    id = params[:id].to_i
    car = Car.apiFind(id)

    content_type :json

    car.to_json
  end

  post '/api/posts' do

    data = JSON.parse( request.body.read.to_s)

    new_car = {
      title: data['title'],
      body: data['body'],
      image: data['image']
    }

    car = Car.api_create(new_car)
    content_type :json

    new_car.to_json

  end

  put '/api/cars/:id' do
    data = JSON.parse( request.body.read.to_s)

    updated_car = {
      title: data['title'],
      body: data['body'],
      image: data['image']
    }

    car = Car.api_update(updated_car)

    content_type :json
    updated_car.to_json
  end




end
