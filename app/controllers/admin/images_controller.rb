class Admin::ImagesController < AdminController
  
  public
  def edit 
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    
    respond_to do |format|
      format.js    
    end
  end
  
  def update 
    @image = Image.find(params[:id])
   
    respond_to do |format|
      if @image.update_attributes(image_params)
        format.js
      end    
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.photo.destroy
    @image.destroy
    
   respond_to do |format|
      format.js    
    end
  end
  
  private
  def image_params
    params.require(:image).permit(:title,:description)
  end
  
end
