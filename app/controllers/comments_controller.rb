class CommentsController < ApplicationController
  
  def create
    comments_params = comment_params
    comments_params[:user_id] = current_user.id
    @commentable = find_commentable
    @comment = @commentable.comments.new comments_params
    
    if @comment.save
      redirect_to @commentable
    else
      render :action => 'new'
    end

    #raise @commentable.to_yaml
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
