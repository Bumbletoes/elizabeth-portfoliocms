class WelcomeController < ApplicationController
    def index 
        @navItems = Gallery.all
    end
end
