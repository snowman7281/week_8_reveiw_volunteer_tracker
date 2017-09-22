require 'rspec'
require 'pg'
require 'projects'
require 'volunteers'
require 'pry'


DB = PG.connect({:dbname => 'volunteer_tracker'})
