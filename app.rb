require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})
also_reload('lib/**/*.rb')

get('/') do
  redirect to ('/projects')
end


get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  id = params[:id]
  Project.new({:title => title, :id => id}).save
  redirect to ('/projects')
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i).delete
  redirect to ('/projects')
end

post('/projects/:id') do
  # first approach
  # volunteer_name = params[:volunteer_name]
  # proj_id = params[:id]
  # Volunteer.new({:name => volunteer_name, :project_id => proj_id, :id => nil}).save
  # redirect to "/projects/#{params[:id]}"

  # New approach for this method
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title]})
  @projects = Project.all
  redirect to ('/projects')
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  project = Project.new({:title => @project.title, :id => params[:id]})
  @volunteers = project.volunteers
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

post('/projects/:project_id/volunteers') do

end

get('/projects/:id/volunteers/:volunteer_id') do

end

patch('/projects/:id/volunteers/:volunteer_id') do

end
