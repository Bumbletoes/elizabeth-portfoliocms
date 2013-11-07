class Admin::ImagesController < AdminController
  def index
   @gallery = Gallery.includes(:images).find(params[:gallery_id])
   @images = @gallery.images
   respond_to do |format|
      format.js    
    end

  end

  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(params[:post])

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
      
  end
  
end
