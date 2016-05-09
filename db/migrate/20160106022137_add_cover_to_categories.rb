class AddCoverToCategories < ActiveRecord::Migration
  def change
  	add_attachment :categories, :cover
  end
end
