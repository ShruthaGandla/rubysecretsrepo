class SessionsController < ApplicationController
   
   def new
   end
    
   def create
      @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
  
      if(@user)
        session[:id] = @user.id
        puts @user.name
        redirect_to '/users/profile'
      else
        flash[:error] = "No user found"
        redirect_to '/sessions/new'

      end
  
  end
   
   
    def destroy
      session.clear
      redirect_to '/sessions/new'
        
    end

   
    
end
