# REQUIRE DEPENDENCIES
require 'sinatra'
require 'pry'
require './lib/food.rb'

# FOOD ARRAY
foods = []

# CRUD
# GET/INDEX
get "/" do
    erb :index, :locals => { :foods => foods }
end

# SHOW 1 FOOD
get "/foods/:id" do
    food = foods.select { |f| f.id === params[:id].to_i }
    erb :show, :locals => { :food => food[0] }
end

# POST/CREATE FOOD
post "/foods" do
    new_food = Food.new(params[:name], params[:description], params[:calorie_count], params[:gluten_free], params[:deliciousness_factor])
    foods.push(new_food)
    redirect "/"
end