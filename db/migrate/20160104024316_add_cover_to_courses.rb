class AddCoverToCourses < ActiveRecord::Migration
  def change
  	add_attachment :courses, :cover
  end
end
