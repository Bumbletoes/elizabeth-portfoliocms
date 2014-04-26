class WelcomeController < ApplicationController
    def index 
        @navItems = Gallery.all
    end

    def load_about
        @about = User.find_by(:username, 'levi');
        respond_to do |format|
            format.js
        end
    end

    def load_gallery
        @gallery_images = Gallery.all_images_for_gallery(params[:id])
        respond_to do |format|
            format.js
        end
    end
end
