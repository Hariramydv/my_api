class Api::V1::CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all 
    render json: @campaigns
  end

  def show
    @campaign =Campaign.find(params[:id])
    render json: @campaign
  end

  def update
    @campaign =Campaign.find(params[:id])
    if @campaign
      @campaign.update(campaign_params)
      render json: {message: 'campaign successfully updated'}, status: 200
    else
      render error: {error: "unable to update campaign"}, status: 400
    end
  end

  def create
    @campaign =Campaign.new(campaign_params)
    if @campaign.save
      render json: @campaign
    else
      render error: {error: "unable to create campaign"}, status: 400
    end
  end

  def destroy
    @campaign =Campaign.find(params[:id])
    if @campaign.destroy
      render json: {message: "successfully destroyed"}, status: 200
    else
      render error: {error: "not destroyed" }, status: 404
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :estimated_duration)
  end

end
