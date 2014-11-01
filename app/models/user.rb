class User < ActiveRecord::Base
	has_many :goals
	validates :first_name, :presence=>{:message=>"Please enter your first name"}
	validates :last_name, :presence=>{:message=>"Please enter your last name"}
	validates :username, :presence=>{:message=>"Please enter your username"}
	validates 	:email, 
				:presence=>{:message=>"Please enter email"},
				:format=>{ with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }

	def fullname
		"#{first_name} #{last_name}"
	end
end
