require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects = Project.all()
  erb(:index)
end

post('/') do
  project_title = params.fetch("project_title")
  project = Project.new({:title => project_title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @volunteers = Volunteer.all()
  erb(:project)
end

get('/projects/:id/edit') do
  @place = 'projects'
  @project = Project.find(params[:id].to_i)
  erb(:edit)
end

patch('/projects/:id/edit') do
  project = Project.find(params[:id].to_i)
  project.update({title: params["title"]})
  redirect "/projects/#{project.id}"
end

delete('/projects/:id/delete') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect '/'
end

post('/projects/:id') do
  project_id = params.fetch("project_id").to_i
  volunteer_name = params.fetch("volunteer_name")
  volunteer = Volunteer.new({:name => volunteer_name, :project_id => project_id, :id => nil})
  volunteer.save()
  redirect '/'
end

get('/volunteers/:id') do
  @place = 'volunteers'
  @volunteer = Volunteer.find(params[:id].to_i)
  @projects = Project.all
  erb(:volunteer)
end

patch ('/volunteers/:id/edit') do
  volunteer = Volunteer.find(params[:id].to_i)
  volunteer.update({name: params["name"]})
  redirect "/projects/#{volunteer.project_id}"
end

delete('/volunteers/:id/delete') do
  volunteer = Volunteer.find(params[:id].to_i)
  volunteer.delete
  redirect "/projects/#{volunteer.project_id}"
end
