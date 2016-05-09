class CoursesController < ApplicationController
  before_action :set_course, except: [:index, :new, :create, :show]
  
  def index
    @categories = Category.all
  end

  def show
  	@course = Course.find(params[:id])
  end

  def new
  	@course = Course.new
    @categories = Category.all
  end

  def create
  	@course = Course.new(course_params)
    @course.categories = params[:categories]
  	if @course.save
  	  redirect_to @course
    else
      render :action => 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    @course.categories = params[:categories]
    redirect_to @course
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :cover, :poster, :categories)
  end

  def set_course
    #raise course_path.to_yaml
    @course = Course.find(params[:id])
  end

end
