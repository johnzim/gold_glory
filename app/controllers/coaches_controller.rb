class CoachesController < ApplicationController
  
 def index
    @title = "All Coaches"
    @coaches = Coach.paginate(:page => params[:page])


    @spampost = Spampost.new
    @spamfeed_items = Spampost.limit(5) 

  end

   
  def create
    @coach = current_user.coaches.build(params[:coach])

	@coach.nationality = current_user.country

    @coach.save
    
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end

  end 


  def buy
  end

end



