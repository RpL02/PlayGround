class AddPosterToCourses < ActiveRecord::Migration
  def change
  	add_attachment :courses, :poster
  end
end
