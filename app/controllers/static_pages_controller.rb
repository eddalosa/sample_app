class StaticPagesController < ApplicationController
  def home
  	@blogs = Blog.order("created_at DESC")
  end

  def help
  end

  def about
  end

  def contact
  end
end
