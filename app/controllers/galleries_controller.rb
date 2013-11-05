class GalleriesController < ApplicationController
  def index
    @gallery = Gallery.find(params[:id])
  end
  
  
  def new
     @gallery = Gallery.new
     @gallery.name = 'New Gallery'
     
     respond_to do |format|
       if @gallery.save
         format.js    
       end
       
     end     
   end
   
   def create
     @gallery = Gallery.new(params[:post])
    
     if @image.save
       redirect_to @gallery
     else
       render 'new'
     end
       
   end
   
   def destroy
     @gallery = Gallery.find(params[:id])
     @gallery.destroy
     
     respond_to do |format|
      format.js 
     end
     
   end

end
