class CoreArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_core_article, only: [:show, :edit, :update, :destroy]
  before_action :set_defaults

  # GET /core_articles
  # GET /core_articles.json
  def index
    @core_articles = CoreArticle.all
  end

  # GET /core_articles/1
  # GET /core_articles/1.json
  def show
    @core_articles = CoreArticle.all
    @content = @core_article
    if params[:name] == 'breath_of_quran'
      @name = 'breath_of_quran'
    else
      @name = params[:id]
    end
  end

  # GET /core_articles/new
  def new
    @core_article = current_user.core_articles.build
  end

  # GET /core_articles/1/edit
  def edit
  end

  # POST /core_articles
  # POST /core_articles.json
  def create
    @core_article = current_user.core_articles.build(core_article_params)
    if core_article_params[:image].present?
      data = Cloudinary::Uploader.upload(core_article_params[:image],@auth)
      @core_article.public_id = data['secure_url']
      @core_article.image_file_size = data['bytes']
    end

    respond_to do |format|
      if @core_article.save
        format.html { redirect_to @core_article, notice: 'Core article was successfully created.' }
        format.json { render :show, status: :created, location: @core_article }
      else
        format.html { render :new }
        format.json { render json: @core_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core_articles/1
  # PATCH/PUT /core_articles/1.json
  def update
    new_params = core_article_params
    if core_article_params[:image].present?
      Cloudinary::Uploader.destroy(@core_article.public_id.split("/").last.split(".")[0] ,@auth) if @core_article.public_id.present?
      data = Cloudinary::Uploader.upload(core_article_params[:image],@auth)
      new_params['public_id'] = data['secure_url']
      new_params['image_file_size'] = data['bytes']
    end
    respond_to do |format|
      if @core_article.update(new_params)
        format.html { redirect_to @core_article, notice: 'Core article was successfully updated.' }
        format.json { render :show, status: :ok, location: @core_article }
      else
        format.html { render :edit }
        format.json { render json: @core_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /core_articles/1
  # DELETE /core_articles/1.json
  def destroy
    Cloudinary::Uploader.destroy(@core_article.public_id.split("/").last.split(".")[0] ,@auth) if @core_article.public_id.present?
    @core_article.destroy
    respond_to do |format|
      format.html { redirect_to core_articles_url, notice: 'Core article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_core_article
    @core_article = CoreArticle.find(params[:id])
  end

  def set_defaults
    @auth = {:cloud_name=>"dg51396pz", :api_key=>"177223146884353", :api_secret=>"PXSWHw8Lp-Kttp6PRKr-FPon9Ok"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def core_article_params
    params.require(:core_article).permit(:title, :body, :user_id, :rank, :image, :short_description, :title_keyword)
  end
end
