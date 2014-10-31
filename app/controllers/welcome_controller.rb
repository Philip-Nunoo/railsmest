class WelcomeController < ApplicationController
  def index
  	@users = User.all
  end
  def sign_in
  	
  end
end
