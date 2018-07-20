class PicsController < ApplicationController

  def destroy
    @auth = {:cloud_name=>"dg51396pz", :api_key=>"177223146884353", :api_secret=>"PXSWHw8Lp-Kttp6PRKr-FPon9Ok"}
    @pic = Pic.find(params[:pic_id])
    Cloudinary::Uploader.destroy(@pic.public_id.split("/").last.split(".")[0] ,@auth) if @pic.public_id.present?
    @pic.delete

    @gallery = Gallery.find(params[:gallery_id])
    redirect_to edit_gallery_path(@gallery), notice: 'Pic was successfully deleted.'

  end

end