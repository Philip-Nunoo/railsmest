class UserController < ApplicationController
	def create
		params = user_params

		user = User.new 
		user.username = params[:username]
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]
		user.email = params[:email]
		

		if user.save
			pass = Pass.new 
			pass.user = user
			pass.email = user.email
			pass.password = params[:password]
			pass.password_confirmation = params[:password_confirmation]			

			if pass.save				
				flash[:notice] = "Registration Complete, Please Sign In to continue..."
				redirect_to :controller => :welcome, :action => :index and return
			else
				flash[:alert] = "Error occured #{pass.errors.messages}"
			end

		else
			flash[:alert] = "Error occured #{user.errors.messages}"

		end

		redirect_to :register and return

	end

	private

	def user_params
		allow = [:first_name, :last_name, :email, :username, :password, :password_confirmation]
		params.require(:user).permit(allow)
	end
end
