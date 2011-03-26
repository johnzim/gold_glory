class PagesController < ApplicationController

 # before_filter :admin_user, :only => :admin_dashboard
  def home
    @title = "Home"
    @user = current_user unless current_user.nil?
    if signed_in?
     
      @athlete = Athlete.new
      @roster_items = current_user.roster.paginate(:page => params[:page])

      @spampost = Spampost.new
      @spamfeed_items = Spampost.limit(5) 
    end
  end

  def tpspend
    @title = "Spend Talent Points"
    @athlete = Athlete.new
    @roster_items = current_user.roster.paginate(:page => params[:page])
     
    @spampost = Spampost.new
    @spamfeed_items = Spampost.limit(5) 
  end

  def admin_dashboard
    @title = "Admin Dashboard"
    @users = User.paginate(:page => params[:page])

    @spampost = Spampost.new
    @spamfeed_items = Spampost.limit(5) 

  end

  def contact
    @title = "Title"
  end

  def about
    @title = "About"
  end

end
