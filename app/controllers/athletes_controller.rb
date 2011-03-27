class AthletesController < ApplicationController
  include AthletesHelper
  before_filter :authenticate 

  def create
    @athlete = current_user.athletes.build(params[:athlete])


    @athlete.save
    @roster_items = current_user.roster.paginate(:page => params[:page])

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end

  end 

  def edit

    @roster_items = current_user.roster.paginate(:page => params[:page])

    @edathlete = Athlete.find(params[:id])
    @athlete = Athlete.find(params[:id])
    @tp_cost = tp_cost(@athlete)
    respond_to do |format|
      format.js
    end
  end

  def name_edit
    @roster_items = current_user.roster.paginate(:page => params[:page])

    @edathlete = Athlete.find(params[:id])
    @athlete = Athlete.find(params[:id])
    @tp_cost = tp_cost(@athlete)
    respond_to do |format|
      format.js
    end
  end

  def update
    @athlete = Athlete.find(params[:id])
    @athlete.update_attributes(params[:athlete])
    @athlete.update_attributes(:tps => tp_cost(@athlete))
    @athlete.update_attributes(:penalty_tps => tp_penalty(@athlete))
#    @roster_items = current_user.roster.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end
 


 def show
    @title = "View Athlete"
    @athlete = Athlete.find(params[:id])

  end

 def tpspend
    @title = "Spend Talent Points"
    @roster_items = current_user.roster.paginate(:page => params[:page])

    respond_to do |format|
      format.js
    end
  end

  def index
    @title = "All Athletes"
    @athletes = Athlete.paginate(:page => params[:page])


    @spampost = Spampost.new
    @spamfeed_items = Spampost.limit(5) 

  end

end
