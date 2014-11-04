class UserController < ApplicationController
	layout 'welcome'
	
	def logout
		sign_out :pass
		redirect_to :root
	end

	def user_sign_in
		params = user_params
		@user = User.find_by :email => params[:email]
		
		if @user
			pass = Pass.find_by :user => @user

			if pass.valid_password?(params[:password])
				sign_in :pass, pass
				redirect_to :userpage_index and return
			else
				flash[:notice] = "Invalid password"				
			end
		else
			flash[:notice] = "Invalid email or password"	
		end

		render 'signIn'
	end

	def signUp
		if !@user
			@user = User.new
		end
	end

	def signIn
		if !@user
			@user = User.new
		end		
	end

	def create
		params = user_params

		@user = User.new 	:username=>params[:username], 
							:first_name=>params[:first_name], 
							:last_name=>params[:last_name], 
							:email=>params[:email]	

		if @user.valid?
			pass = Pass.new 
			pass.user = @user
			pass.email = @user.email
			pass.password = params[:password]
			pass.password_confirmation = params[:password_confirmation]			

			if pass.valid?
				@user.save
				pass.save				
				flash[:notice] = "Registration Complete, Please Sign In to continue..."
				redirect_to :controller => :welcome, :action => :index and return
			else
				flash[:alert] = "Error occured #{pass.errors.messages}"
			end

		else
			flash[:alert] = "Error occured #{@user.errors.messages}"
		end

		render 'signUp'

	end

	private

	def user_params
		allow = [:first_name, :last_name, :email, :username, :password, :password_confirmation]
		params.require(:user).permit(allow)
	end
end
