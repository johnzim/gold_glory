class PagesController < ApplicationController
  include GamestateHelper

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

def deactivate_help_tips 
	current_user.help_tips = false
	redirect_to root_path

    respond_to do |format|
      format.js { redirect_to root_path }
    end
end

  def marketplace
    @title = "Marketplace"
    @user = current_user unless current_user.nil?
    if signed_in?
   
  
	@coach = current_user.coaches.new
	
      @spampost = Spampost.new
      @spamfeed_items = Spampost.limit(5) 
    end
  end


  def tpspend
    @title = "Spend Talent Points"
    @athlete = Athlete.new
    @roster_items = current_user.roster.paginate(:page => params[:page])
    @user = current_user unless current_user.nil?
    
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
