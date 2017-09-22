require 'sinatra'
require 'sinatra/reloader'
require './lib/projects'
require './lib/volunteers'
also_reload 'lib/**/*.rb'
require 'pg'

DB = PG.connect({:dbname => "volunteer_tracker"})


get("/") do
  erb(:index)
end
