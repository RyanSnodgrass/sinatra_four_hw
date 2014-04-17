require 'sinatra'
require "sinatra/activerecord"

#RACK_ENV=production rackup config.ru
set :database, "sqlite3:///sinatra_four_hw_app.db"

class Professor <ActiveRecord::Base
end

class Course <ActiveRecord::Base
end

class Subject <ActiveRecord::Base
end