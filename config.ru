require 'sinatra'
require 'sinatra/reloader' if development?
require_relative "controller/dog_controller.rb"

run DogController
