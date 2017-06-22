class SecretsController < ApplicationController
  
  
  def create
    
     @secret = Secret.create(content:params[:secret][:content],user:current_user)
        if !@secret.errors.full_messages.empty?
            flash[:error] = @secret.errors.full_messages
            redirect_to '/users/profile'
        else 
            redirect_to '/users/profile'
        end
        
    
  end

  def destroy
      secret = Secret.find(params[:id])
     secret.destroy
     redirect_to '/users/profile'
  end

  # private
  #   def user_params
  #     params.require(:secret).permit(:content) 
  #   end
end
