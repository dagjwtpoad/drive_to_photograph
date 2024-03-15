class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to photograph_path(@comment.photograph)
    else
      @photograph = @comment.photograph
      @comments = @photograph.comments
      render "photographs/show"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, photograph_id: params[:photograph_id])
  end
end
