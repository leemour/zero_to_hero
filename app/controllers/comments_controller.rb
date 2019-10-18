class CommentsController < ApplicationController
  def create
    @commentable = load_commentable
    @comment = @commentable.comments.create(comment_params)
    commentable_type = @comment.commentable_type.downcase
    redirect_to send("#{commentable_type}_path", @commentable)
  end

  def destroy
    @commentable = load_commentable
    @comment = @commentable.comments.find(params[:id])
    commentable_type = @comment.commentable_type.downcase
    if @comment.destroy
      flash[:notice] = "Comment #{@comment.id} successfully destroyed"
    else
      flash[:error] = "Comment #{@comment.id} could not be destroyed"
    end

    redirect_to send("#{commentable_type}_path", @commentable)
  end

  private

  def load_commentable
    commentable_key = params.keys.find { |key| key.end_with? "_id" }
    commentable_model = commentable_key.sub("_id").camelize.constantize
    commentable_model.find(params[commentable_key])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(commenter: current_user)
  end
end
