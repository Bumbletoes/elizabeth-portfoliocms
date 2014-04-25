class Admin::UsersController < AdminController
    def index
        @user = User.find_by(:username => 'levi')
    end
end
