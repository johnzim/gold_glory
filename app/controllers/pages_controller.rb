class PagesController < ApplicationController
  def home
    @title = "Home"
    @user = current_user unless current_user.nil?
    if signed_in?
      @spampost = Spampost.new
      @spamfeed_items = Spampost.all 
    end
  end

  def contact
    @title = "Title"
  end

  def about
    @title = "About"
  end

end
