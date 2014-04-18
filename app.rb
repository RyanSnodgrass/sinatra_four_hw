require 'sinatra'
require "sinatra/activerecord"

#RACK_ENV=production rackup config.ru
set :database, "sqlite3:///sinatra_four_hw_app.db"

get "/" do 
	erb :"home"
end
		# "/courses/index"
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

get "/courses/:id/show.erb" do
	#ruby commands with sql
	erb :"/courses/show"
end

class Professor <ActiveRecord::Base
end

class Course <ActiveRecord::Base
end

class Subject <ActiveRecord::Base
end