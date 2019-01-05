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

# GET/SHOW EDIT PAGE
get "/foods/:id/edit" do
    food = foods.select { |f| f.id === params[:id].to_i }
    erb :edit, :locals => { :food => food[0] }
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

# UPDATE
put "/foods/:id" do
    food = foods.select { |f| f.id === params[:id].to_i }
    food[0].name = params[:name]
    food[0].description = params[:description]
    food[0].calorie_count = params[:calorie_count].to_i
    food[0].gluten_free = params[:gluten_free]
    food[0].deliciousness_factor = params[:deliciousness_factor].to_i
    redirect "/foods/#{params[:id]}"
end

# DELETE
delete "/foods/:id" do
    foods.delete_if { |f| f.id === params[:id].to_i }
    redirect "/"
end
