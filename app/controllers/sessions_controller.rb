class SessionsController < ApplicationController
	def new
		
	end

	 def create
	    user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      sign_in user
	      if user.admin?
	      	redirect_to users_path
	      else
	      	redirect_back_or user
	      end
	    else
	      flash.now[:warning] = 'Invalid Email/Password Combination'
	      render 'new'
	    end
	 end

	def destroy
	    sign_out
	    redirect_to root_url
	end
end
