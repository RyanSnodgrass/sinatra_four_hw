class CreateTables < ActiveRecord::Migration
    def change
  	create_table :professors do |t|
  		t.string :name
  		t.string :gender
  		t.integer :age
  	end

  	create_table :courses do |t|
  		t.string :name
  		t.date :start_date
  		t.date :end_date
  		t.boolean :major_required
  		t.string :professor
  		t.string :subject
  	end
  	
  	create_table :subjects do |t|
  		t.string :genre
  		t.string :building
  	end
  end
end