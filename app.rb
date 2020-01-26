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

end

post('/projects') do

end

delete('/projects/:id') do

end

post('/projects/:id') do

end

get('/projects/:id/edit') do

end

get('/projects/:id') do

end

post('/projects/:project_id/volunteers') do

end

get('/projects/:id/volunteers/:volunteer_id') do

end

patch('/projects/:id/volunteers/:volunteer_id') do

end
