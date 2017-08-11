class HomeController < ApplicationController

  def welcome
    @recent_posts = Post.last(3)
  end

end
