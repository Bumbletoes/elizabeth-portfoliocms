class Admin::UsersController < AdminController
    def index
        @user = User.find_by(:username => 'levi')
    end

    def update 
        @user = User.find_by(:username => 'levi')

        if @user.update_attribute(:about_me, user_params[:about_me])
            redirect_to admin_galleries_url
        end
    end
   
    private
    def user_params
        params.require(:user).permit(:about_me)
    end

end
