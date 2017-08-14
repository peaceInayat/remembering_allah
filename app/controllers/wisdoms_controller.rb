class WisdomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_wisdom, only: [:show, :edit, :update, :destroy]

  # GET /wisdoms
  # GET /wisdoms.json
  def index
    if params[:category_id].blank?
      @wisdoms = Wisdom.all.order('rank')
    else
      @wisdoms = Wisdom.where(category_id: params[:category_id]).order("rank")
    end
  end

  # GET /wisdoms/1
  # GET /wisdoms/1.json
  def show
    @content = @wisdom
  end

  # GET /wisdoms/new
  def new
    @wisdom = current_user.wisdoms.build
  end

  # GET /wisdoms/1/edit
  def edit
  end

  # POST /wisdoms
  # POST /wisdoms.json
  def create
    @wisdom = current_user.wisdoms.build(wisdom_params)

    respond_to do |format|
      if @wisdom.save
        format.html { redirect_to @wisdom, notice: 'Wisdom was successfully created.' }
        format.json { render :show, status: :created, location: @wisdom }
      else
        format.html { render :new }
        format.json { render json: @wisdom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wisdoms/1
  # PATCH/PUT /wisdoms/1.json
  def update
    respond_to do |format|
      if @wisdom.update(wisdom_params)
        format.html { redirect_to @wisdom, notice: 'Wisdom was successfully updated.' }
        format.json { render :show, status: :ok, location: @wisdom }
      else
        format.html { render :edit }
        format.json { render json: @wisdom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wisdoms/1
  # DELETE /wisdoms/1.json
  def destroy
    @wisdom.destroy
    respond_to do |format|
      format.html { redirect_to wisdoms_url, notice: 'Wisdom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @wisdom.upvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wisdom
      @wisdom = Wisdom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wisdom_params
      params.require(:wisdom).permit(:title, :body, :category_id, :short_description, :image)
    end
end
