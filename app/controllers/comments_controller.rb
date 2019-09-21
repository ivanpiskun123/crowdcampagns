class CommentsController < ApplicationController

  def create
    @campaign_bound = Campaign.find(params[:campaign_id])
    @comment = @campaign_bound.comments.build(comment_content_param)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @campaign_bound
  end

  def destroy

  end

  private

  def comment_content_param
    params.require(:comment).permit(:content)
  end

end
