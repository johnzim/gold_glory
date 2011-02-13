class SpampostsController < ApplicationController
  before_filter :authenticate 


  def create
    @spampost = current_user.spamposts.build(params[:spampost])
    @spampost.save
    @spamfeed_items = Spampost.limit(5);
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
  
  def destroy
    @spampost.destroy
    redirect_to root_path
  end
  
  def index
    @title = "All spamposts"
    @spamposts = Spampost.paginate(:page => params[:page])
  end

end
