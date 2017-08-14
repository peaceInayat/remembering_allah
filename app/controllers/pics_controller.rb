class PicsController < ApplicationController

  def destroy
    @pic = Pic.find(params[:pic_id])
    @pic.destroy

    @gallery = Gallery.find(params[:gallery_id])
    redirect_to edit_gallery_path(@gallery), notice: 'Post was successfully destroyed.'

  end

end