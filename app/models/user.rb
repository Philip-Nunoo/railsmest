class User < ActiveRecord::Base
	has_many :goals
	validates :first_name, :presence=>{:message=>"Please enter your first name"}
	validates :last_name, :presence=>{:message=>"Please enter your last name"}
	validates 	:username, 
				:presence=>{:message=>"Please enter your username"},
				:uniqueness=>{:message=>"Oops, Username already taken"}
	validates 	:email, 
				:presence=>{:message=>"Please enter email"},
				:format=>{ with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ },
    			:uniqueness=>{:message=>"Oops, Email Address alreadsy in use"}
	def fullname
		"#{first_name} #{last_name}"
	end
end
