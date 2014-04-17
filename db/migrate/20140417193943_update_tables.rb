class UpdateTables < ActiveRecord::Migration
  def change
  	change_table :courses do |t|
  		t.remove :professor, :subject
  		t.integer :professor_id
  		t.integer :subject_id
  	end
  end
end
