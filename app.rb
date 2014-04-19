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
	erb :"courses/show"
end

get "/professors/:id/show.erb" do # calls professors SHOW page
	@professor_to_show = Professor.find(params[:id])
	erb :"professors/show"
end

get "/subjects/:id/show.erb" do # calls subjects SHOW page
	@subject_to_show = Subject.find(params[:id])
	erb :"subjects/show"
end

get "/professors/new.erb" do # ---calls--- Professors NEW page
	erb :"/professors/new"
end

post "/professors/new" do # ---calls--- Professors NEW page
	prof = Professor.new
	prof.name = params[:professor_name]
	prof.gender = params[:professor_gender]
	prof.age = params[:professor_age]
	prof.save
	redirect "/professors/index.erb"
end

class Professor <ActiveRecord::Base
end

class Course <ActiveRecord::Base
end

class Subject <ActiveRecord::Base
end