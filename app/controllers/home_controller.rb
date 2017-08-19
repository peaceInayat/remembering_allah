class HomeController < ApplicationController

  def welcome
    @recent_posts = Post.last(3)
    @recent_videos = Video.last(3)
  end

end
