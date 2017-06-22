class UsersController < ApplicationController

    def new
    end
    

    def create
        @user = User.create(user_params)
        if !@user.errors.full_messages.empty?
            flash[:error] = @user.errors.full_messages
            redirect_to "/"
        else 
            redirect_to '/sessions/new' 
        end
    end

     def profile
      @user = current_user
      @secrets_created = current_user.secrets

      @liked_secrets = current_user.secrets_liked
      puts @liked_secrets.inspect
    end

    def show
        @user = current_user
        @secrets = Secret.all
    end

    def createlikes
        puts Secret.find(params[:id])
         Like.create(user:current_user,secret:Secret.find(params[:id]))
        redirect_to '/allsecrets'
    end

    def unlike
       
        like = Like.where("user_id = ? AND secret_id = ?", current_user.id, params[:id])
        like[0].destroy
       
        redirect_to '/allsecrets'
    end
    
    
    

    private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
    
end
