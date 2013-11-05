class AdminController < ApplicationController
  def index
   
   # testGallery = Gallery.new
   # testGallery.name = 'Default Gallery'
   # testGallery.description = "This is a test gallery."
   # testGallery.save  
    @galleries = Gallery.all
  end
end
