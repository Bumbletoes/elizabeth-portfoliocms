class ImagesController < ApplicationController
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
