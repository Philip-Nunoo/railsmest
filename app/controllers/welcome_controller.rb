class WelcomeController < ApplicationController
  def index
    @users = User.all
    @goals = Goal.all
  end

  def new_goal
  
  end

  def signUp
  	@user = User.new
  end

  
  def sign_in
  	
  end

end

