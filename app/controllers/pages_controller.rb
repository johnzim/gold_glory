class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Title"
  end

  def about
    @title = "About"
  end

end
