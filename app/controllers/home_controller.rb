class HomeController < ApplicationController

  def welcome
    @recent_posts = Post.last(4)
  end




end
