require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/post.rb'
require_relative "controller/dog_controller.rb"

run DogController

use Rack::MethodOverride
