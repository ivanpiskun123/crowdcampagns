class ProfilesController < ApplicationController
  def index_campaigns
    @campaigns = current_user.campaigns.order("updated_at DESC")
  end




end
