class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_defaults

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all.order('rank')
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    if publication_params[:image].present?
      data = Cloudinary::Uploader.upload(publication_params[:image],@auth)
      @publication.public_id = data['secure_url']
      @publication.image_file_size = data['bytes']
    end

    if publication_params[:document].present?
      doc_data = Cloudinary::Uploader.upload(publication_params[:document],@auth)
      @publication.document_content_type = doc_data['secure_url'] # instead of url we are using document_content_type
      @publication.document_file_size = doc_data['bytes']
    end

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    new_params = publication_params
    if publication_params[:image].present?
      Cloudinary::Uploader.destroy(@publication.public_id.split("/").last.split(".")[0] ,@auth) if @publication.public_id.present?
      data = Cloudinary::Uploader.upload(publication_params[:image],@auth)
      new_params['public_id'] = data['secure_url']
      new_params['image_file_size'] = data['bytes']
    end
    if publication_params[:document].present?
      Cloudinary::Uploader.destroy(@publication.document_content_type.split("/").last.split(".")[0] ,@auth) if @publication.document_content_type.present?
      data = Cloudinary::Uploader.upload(publication_params[:document],@auth)
      new_params['document_file_name'] = data['original_filename']+".pdf"
      new_params['document_content_type'] = data['secure_url']
      new_params['document_file_size'] = data['bytes']

      new_params.delete('document')
    end

    respond_to do |format|
      if @publication.update(new_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    Cloudinary::Uploader.destroy(@publication.public_id.split("/").last.split(".")[0] ,@auth) if @publication.public_id.present?
    Cloudinary::Uploader.destroy(@publication.document_content_type.split("/").last.split(".")[0] ,@auth) if @publication.document_content_type.present?
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end

  def set_defaults
    @auth = {:cloud_name=>"dz6tzfuuc", :api_key=>"489574853252648", :api_secret=>"AAMHKTvZsaupPGMtiKNuvJCk0Zk"}
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_params
    params.require(:publication).permit(:title, :body, :event_date, :rank, :image, :document)
  end
end
