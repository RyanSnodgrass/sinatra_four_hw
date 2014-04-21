require 'sinatra'
require "sinatra/activerecord"

#RACK_ENV=production rackup config.ru
set :database, "sqlite3:///sinatra_four_hw_app.db"

get "/" do 
	erb :"home"
end

get "/courses/index.erb" do
	@courses = Course.all
 erb :"/courses/index"
end

get "/professors/index.erb" do
	@professors = Professor.all
 erb :"/professors/index"
end

get "/subjects/index.erb" do 
	@subjects = Subject.all
 erb :"/subjects/index"
end

get "/courses/:id/show.erb" do # calls courses SHOW page
	@course_to_show = Course.find(params[:id])
	@prof_name = Professor.joins('INNER JOIN courses ON 
	courses.professor_id = professors.id')
	.where('courses.id = params[:id]')
	 
	 #@this_prof_id = Course.find(params[:id]).professor_id
	 #@prof_name = Professor.find(@this_prof_id).name

	@this_subj_id = Course.find(params[:id]).subject_id
	@subj_name = Subject.find(@this_subj_id).genre
	
	erb :"courses/show"
end
#Client.joins('LEFT OUTER JOIN addresses ON 
#	addresses.client_id = clients.id')

#SELECT clients.* FROM clients 
#LEFT OUTER JOIN addresses ON addresses.client_id = clients.id

#Professor.joins(INNER JOIN courses ON courses.professor_id = professors.id WHERE courses.id = params[:id])

get "/professors/:id/show.erb" do # calls professors SHOW page
	@professor_to_show = Professor.find(params[:id])


	erb :"professors/show"
end

get "/subjects/:id/show.erb" do # calls subjects SHOW page
	@subject_to_show = Subject.find(params[:id])
	erb :"subjects/show"
end

#------------------------------------------------------#

get "/subjects/new.erb" do # ---calls--- subjects NEW page
	erb :"/subjects/new"
end

post "/subjects/new" do # ---COMPUTES--- subjects NEW page
	subj = Subject.new
	subj.genre = params[:subject_genre]
	subj.building = params[:subject_building]
	subj.save
	redirect "/subjects/index.erb"
end

#------------------------------------------------------#

get "/professors/new.erb" do # ---calls--- Professors NEW page
	erb :"/professors/new"
end

post "/professors/new" do # ---COMPUTES--- Professors NEW page
	prof = Professor.new
	prof.name = params[:professor_name]
	prof.gender = params[:professor_gender]
	prof.age = params[:professor_age]
	prof.save
	redirect "/professors/index.erb"
end

#------------------------------------------------------#

get "/professors/:id/edit" do
	@professor_to_update = Professor.find(params[:id])
	erb :"professors/edit"
end

#@professor_to_update = Professor.find(params[:id])
#@prof_name = @professor_to_update.name

class Professor <ActiveRecord::Base
end

class Course <ActiveRecord::Base
end

class Subject <ActiveRecord::Base
end