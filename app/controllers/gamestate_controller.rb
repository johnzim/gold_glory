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
	
def seed_unemployed_pool 

        	
    @attr_male = {:name => "Smith", :event => "Rowing", :gender => "Male", :nationality => "Poland", :level => 4}
    @attr_female = {:name => "Jones", :event => "Rowing", :gender => "Female", :nationality => "Poland", :level => 4}
    
	10.times do
    	@coach = current_user.coaches.build(@attr_male)
    	@rand = (1+ rand(89))

 		@coach.iconno = @rand
      	@coach.save
    end
    
	10.times do
		@coach = current_user.coaches.build(@attr_female)
		@rand = (1+ rand(89))

		@coach.iconno = @rand
		@coach.save
    end
    
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
