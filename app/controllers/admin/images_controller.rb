class Admin::ImagesController < AdminController
  def destroy
    @image = Image.find(params[:id])
    @image.photo.destroy
    @image.destroy
    
   respond_to do |format|
      format.js    
    end
  end
  
end
