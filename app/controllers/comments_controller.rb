class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :article_id, :user_id)
  end

end
