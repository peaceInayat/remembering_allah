class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]

  # GET /audios
  # GET /audios.json
  def index
    if params[:category_id].blank?
      @audios = Audio.all.order("rank")
      @category_description = Category.first.description
    else
      @audios = Audio.where(category_id: params[:category_id]).order("rank")
      @category_description = Category.find(params[:category_id]).description
    end
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
  end

  # GET /audios/new
  def new
    @audio = Audio.new
  end

  # GET /audios/1/edit
  def edit
  end

  # POST /audios
  # POST /audios.json
  def create
    @audio = Audio.new(audio_params)

    respond_to do |format|
      if @audio.save
        format.html { redirect_to audios_path, notice: 'Audio was successfully created.' }
        format.json { render :show, status: :created, location: @audio }
      else
        format.html { render :new }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1
  # PATCH/PUT /audios/1.json
  def update
    respond_to do |format|
      if @audio.update(audio_params)
        format.html { redirect_to @audio, notice: 'Audio was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio }
      else
        format.html { render :edit }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio.destroy
    respond_to do |format|
      format.html { redirect_to audios_url, notice: 'Audio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = Audio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_params
      params.require(:audio).permit(:title, :body, :url, :category_id, :rank, :highlight)
    end
end
