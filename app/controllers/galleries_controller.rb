class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :set_defaults

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all.order('rank')
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        if params[:images]
          params[:images].each { |image|
            pic = @gallery.pics.create(image: image)
            data = Cloudinary::Uploader.upload(image,@auth)
            pic.public_id = data['secure_url']
            pic.image_file_size = data['bytes']
            pic.save
          }
        end

        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        if params[:images]
          params[:images].each { |image|
            pic = @gallery.pics.create(image: image)
            data = Cloudinary::Uploader.upload(image,@auth)
            pic.public_id = data['secure_url']
            pic.image_file_size = data['bytes']
            pic.save
          }
        end
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.pics.each do |pic|
      Cloudinary::Uploader.destroy(pic.public_id.split("/").last.split(".")[0] ,@auth) if pic.public_id.present?
      pic.delete
    end
    @gallery.delete
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def set_defaults
    @auth = {:cloud_name=>"dz6tzfuuc", :api_key=>"489574853252648", :api_secret=>"AAMHKTvZsaupPGMtiKNuvJCk0Zk"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:title, :body, :rank, :event_date)
  end
end
