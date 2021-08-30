require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.find(1).number
  erb :index
end

get '/plus' do
  @number = Count.find(1).number
  @number += 1
  Count.save(number: @number)
  redirect "/"
end

get '/minus' do
  @number = Count.find(1).number
  @number -= 1
  redirect "/"
end

get '/clear' do
  @number = Count.find(1).number
  @number = 0
  redirect "/"
end

get '/double' do
  @number = Count.find(1).number
  @number *= 2
  redirect "/"
end

get '/divide' do
  @number = Count.find(1).number
  @number /= 2
  redirect "/"
end

