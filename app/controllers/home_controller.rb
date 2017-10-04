class HomeController < ApplicationController

  def welcome
    @recent_posts = Post.last(3)
    @recent_videos = Video.last(3)
  end

  def manage_users
    @users = User.all.order('email')
  end

  def update_users
    admin_ids = params[:admin_ids]
    non_admin_ids = params[:all_ids] - admin_ids

    users = Hash.new
    admin_ids.each do |id|
      users[id] = {
          'admin' => 'true'
      }
    end

    non_admin_ids.each do |id|
      users[id] = {
          'admin' => 'false'
      }
    end

    User.update(users.keys, users.values)

    respond_to do |format|
      format.json{render json: admin_ids}
    end
  end

end
