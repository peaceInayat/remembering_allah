class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :set_defaults

  # GET /posts
  # GET /posts.json
  def index
    if params[:category_id].blank?
      @posts = Post.all.order('rank')
    else
      @posts = Post.where(category_id: params[:category_id]).order("rank")
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @content = @post
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    if post_params[:image].present?
      data = Cloudinary::Uploader.upload(post_params[:image],@auth)
      @post.public_id = data['secure_url']
      @post.image_file_size = data['bytes']
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    new_params = post_params
    if post_params[:image].present?
      Cloudinary::Uploader.destroy(@post.public_id.split("/").last.split(".")[0] ,@auth) if @post.public_id.present?
      data = Cloudinary::Uploader.upload(post_params[:image],@auth)
      new_params['public_id'] = data['secure_url']
      new_params['image_file_size'] = data['bytes']
    end
    respond_to do |format|
      if @post.update(new_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    Cloudinary::Uploader.destroy(@post.public_id.split("/").last.split(".")[0] ,@auth) if @post.public_id.present?
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_defaults
    @auth = {:cloud_name=>"dg51396pz", :api_key=>"177223146884353", :api_secret=>"PXSWHw8Lp-Kttp6PRKr-FPon9Ok"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :image, :short_description, :rank)
  end
end
