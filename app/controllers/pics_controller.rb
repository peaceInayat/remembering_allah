class PicsController < ApplicationController

  def destroy
    @auth = {:cloud_name=>"dz6tzfuuc", :api_key=>"489574853252648", :api_secret=>"AAMHKTvZsaupPGMtiKNuvJCk0Zk"}
    @pic = Pic.find(params[:pic_id])
    Cloudinary::Uploader.destroy(@pic.public_id.split("/").last.split(".")[0] ,@auth) if @pic.public_id.present?
    @pic.delete

    @gallery = Gallery.find(params[:gallery_id])
    redirect_to edit_gallery_path(@gallery), notice: 'Pic was successfully deleted.'

  end

end