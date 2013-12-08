class Admin::GalleriesController < AdminController
  NEW_GALLERY_NAME = 'New Gallery'

  public
    def index
      @galleries = Gallery.all
    end
  
    def new
      @gallery = Gallery.new
      @gallery.name = NEW_GALLERY_NAME
     
      respond_to do |format|
         if @gallery.save
           format.js    
        end
      end     
    end

  def edit
    @gallery = Gallery.includes(:images).find(params[:id])
    @gallery.images.new
    @images = @gallery.images
  end
   
  def update
    @gallery = Gallery.find(params[:id])
    
    if @gallery.update_attributes(gallery_params)
      redirect_to admin_galleries_url
    end
  end
   
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
     
    respond_to do |format|
      format.js 
    end  
  end
  
  def upload
    @gallery = Gallery.find(params[:id])
  
    @image = Image.create(image_params)
    @image.title = params[:filename]
    @image.gallery = @gallery
    @image.save 
    
    respond_to do |format|
      format.js 
    end
    
  end

  private
    def gallery_params
      params.require(:gallery).permit(:name,:description)
    end

    def image_params
      params.require(:gallery).require(:images).permit(:photo)
    end 

end
