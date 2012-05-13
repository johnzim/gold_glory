class GamestateController < ApplicationController

#  before_filter :admin_user

  def generate_athletes
    
    @users = User.all
    
    @users.each do |user|
      user.roster.each do |athlete|
        calculate_stats athlete
      end
    end
    
    flash[:success] = "*** Athlete stats generated successfully"
    redirect_to :controller => :pages, :action => "admin_dashboard"

  end
  
  def activate_creation
  
  	@users = User.all
  
  	@users.each do |user|
 	  user.update_attribute(:creation_mode, true)
  	end
  
    flash[:success] = "*** Creation Mode Activated Successfully"
    redirect_to :controller => :pages, :action => "admin_dashboard"

	end
	

	
def activate_help_tips
  
  	@users = User.all
  
  	@users.each do |user|
 	  user.update_attribute(:help_tips, true)
  	end
  
    flash[:success] = "*** Help Tips Activated Successfully"
    redirect_to :controller => :pages, :action => "admin_dashboard"

	end
	
	def deactivate_creation
  
  	@users = User.all
  
  	@users.each do |user|
 	  user.update_attribute(:creation_mode, false)
  	end
  
    flash[:success] = "*** Creation Mode Deactivated Successfully"
    redirect_to :controller => :pages, :action => "admin_dashboard"

	end

end
