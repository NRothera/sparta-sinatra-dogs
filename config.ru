require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/post.rb'
require_relative './models/car.rb'
require_relative "controller/dog_controller.rb"
require_relative "controller/car_controller.rb"

run Rack::Cascade.new ([
  CarController,
  DogController
  ])


use Rack::MethodOverride
