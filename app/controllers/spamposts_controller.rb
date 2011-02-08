class SpampostsController < ApplicationController


  def create
    @spampost = current_user.spamposts.build(params[:spampost])
    if @spampost.save
      flash[:success] = "Spampost Created!"
      redirect_to root_path
    else
      @feed_items = []
      render root_path
    end
  end

  def destroy
    @spampost.destroy
    redirect_to root_path
  end

end
