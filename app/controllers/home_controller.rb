class HomeController < ApplicationController

  def welcome
    @recent_boq = CoreArticle.where(highlight:true).last(3)
    @recent_posts = Post.where(highlight:true).last(3)
    @recent_videos = Video.where(highlight:true).last(3)
    @recent_wisdoms = Wisdom.where(highlight:true).last(3)
    @q_links = Misc.where(code:'quick_link')
  end

  def manage_users
    @users = User.all.order('email')
    authorize! :edit, @users
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

  def quick_links
    @q_links = Misc.where(code:'quick_link')
  end

  def update_quick_links
    qls_data = params[:qls_data].values
    qls_data.each do |data|
      Misc.find_by_id(data[0]).update(name:data[1], body:data[2])
    end
    respond_to do |format|
      format.json{render json: qls_data}
    end
  end

  def manage_boq_highlights
    @boqs = CoreArticle.all.order('title')
    authorize! :edit, @boqs
  end

  def manage_post_highlights
    @posts = Post.all.order('title')
    authorize! :edit, @posts
  end

  def manage_video_highlights
    @videos = Video.all.order('title')
    authorize! :edit, @videos
  end

  def manage_wisdom_highlights
    @wisdoms = Wisdom.all.order('title')
    authorize! :edit, @wisdoms
  end

  def update_highlights
    highlight_ids = params[:checked_ids]
    non_highlight_ids = params[:all_ids] - highlight_ids
    highlight_id = params[:highlight_id].to_i

    highlights = Hash.new
    highlight_ids.each do |id|
      highlights[id] = {
          'highlight' => 'true'
      }
    end

    non_highlight_ids.each do |id|
      highlights[id] = {
          'highlight' => 'false'
      }
    end

    if (highlight_id == 1)
      CoreArticle.update(highlights.keys, highlights.values)
    elsif (highlight_id == 2)
      Post.update(highlights.keys, highlights.values)
    elsif (highlight_id == 3)
      Video.update(highlights.keys, highlights.values)
    elsif (highlight_id == 4)
      Wisdom.update(highlights.keys, highlights.values)
    end

    respond_to do |format|
      format.json{render json: highlight_ids}
    end
  end



end
