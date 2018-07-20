class TestimonialsController < ApplicationController
  load_and_authorize_resource
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :set_defaults

  # GET /testimonials
  # GET /testimonials.json
  def index
    # @testi_first = Testimonial.first
    # @testimonials = Testimonial.where("id > ?", @testi_first.id)
    render '_index.html.haml'
  end

  # GET /testimonials/1
  # GET /testimonials/1.json

  # GET /testimonials/new
  def new
    @testimonial = Testimonial.new
  end

  # GET /testimonials/1/edit
  def edit
  end

  # POST /testimonials
  # POST /testimonials.json
  def create
    @testimonial = Testimonial.new(testimonial_params)
    if testimonial_params[:image].present?
      data = Cloudinary::Uploader.upload(testimonial_params[:image],@auth)
      @testimonial.public_id = data['secure_url']
      @testimonial.image_file_size = data['bytes']
    end

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to testimonials_path, notice: 'Testimonial was successfully created.' }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testimonials/1
  # PATCH/PUT /testimonials/1.json
  def update
    new_params = testimonial_params
    if testimonial_params[:image].present?
      Cloudinary::Uploader.destroy(@testimonial.public_id.split("/").last.split(".")[0] ,@auth) if @testimonial.public_id.present?
      data = Cloudinary::Uploader.upload(testimonial_params[:image],@auth)
      new_params['public_id'] = data['secure_url']
      new_params['image_file_size'] = data['bytes']
    end
    respond_to do |format|
      if @testimonial.update(new_params)
        format.html { redirect_to testimonials_path, notice: 'Testimonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    Cloudinary::Uploader.destroy(@testimonial.public_id.split("/").last.split(".")[0] ,@auth) if @testimonial.public_id.present?
    @testimonial.destroy
    respond_to do |format|
      format.html { redirect_to testimonials_url, notice: 'Testimonial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def set_defaults
    @auth = {:cloud_name=>"dg51396pz", :api_key=>"177223146884353", :api_secret=>"PXSWHw8Lp-Kttp6PRKr-FPon9Ok"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def testimonial_params
    params.require(:testimonial).permit(:body, :name, :profession, :image, :rank)
  end
end
