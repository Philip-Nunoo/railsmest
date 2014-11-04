class UserpageController < ApplicationController
	before_action :authenticate_pass!

	def index
    	@goals = Goal.where :user=> current_pass.user
	end
end
