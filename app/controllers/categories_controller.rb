class CategoriesController < ApplicationController
	before_action :set_category, except: [:index, :new, :create]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to @category
	end

	def show

	end

	def edit
	end

	def update
		@category.update(category_params)
		redirect_to @category
	end


	private

	def category_params
		params.require(:category).permit(:name, :color, :cover)
	end

	def set_category
		@category = Category.find(params[:id])
	end
end
