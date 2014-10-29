class User < ActiveRecord::Base
	has_many :goals
	validates :first_name, :presence=>{:message=>"Please enter your first name"}
	validates :last_name, :presence=>{:message=>"Please enter your last name"}
	validates :username, :presence=>{:message=>"Please enter your username"}
end
