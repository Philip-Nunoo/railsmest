class UserpageController < ApplicationController
	before_action :authenticate_pass!
	def index
	end
end
