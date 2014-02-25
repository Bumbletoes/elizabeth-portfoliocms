class GalleriesController < ApplicationController
    public
    def getImages
      gallery = Gallery.find(params[:id])
      @response = Hash.new
      @response[:name] = gallery.name
      render json: @response
    end
end
