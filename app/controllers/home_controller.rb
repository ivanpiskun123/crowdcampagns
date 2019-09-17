class HomeController < ApplicationController

  def news

  end

  def all_campaign_list
    @campaigns = Campaign.all.order("updated_at DESC")
  end

  def top_rated_campaigns

  end


  def confirm_wait


  end


end
