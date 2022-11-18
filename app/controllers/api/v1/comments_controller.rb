class Api::V1::CommentsController < ApplicationController
  before_action :set_campaign
  def index
    @comments = @campaign.comments 
    
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment
      @comment.update(comment_params)
      render json: {message: 'Comment successfully updated'}, status: 200
    else
      render error: {error: "unable to update Comment"}, status: 400
    end
  end

  def create
    
    @comment = @campaign.comments.new(comment_params)
    if @comment.save
      render json: {message: "comment created successfully"}
    else
      render error: {error: "unable to create Comment"}, status: 400
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: {message: "successfully destroyed"}, status: 200
    else
      render error: {error: "not destroyed" }, status: 404
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:text, :campaign_id)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])

  end

end
