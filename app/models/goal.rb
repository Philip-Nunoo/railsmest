class Goal < ActiveRecord::Base
	belongs_to :user
	validates :user, :presence=>{:message=>"Please set user"}
	validates :title, :presence=>{:message=>"Please enter title"}
	validates	:description, 
				:presence=>{:message=>"No description entered"},
				:length=>{:minimum=>30, :message=>"Description too short"}

end
