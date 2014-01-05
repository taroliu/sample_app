class User < ActiveRecord::Base
	before_save{self.email=email.downcase}
	validates  :name ,  presence:  true, length: {maximum:50}
	# VALID_EMAIL_REGEX  = /\A[\w+\-.]+@[az\d\-.]+\.[az]+\z/i
	VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
	validates  :email ,  presence: true , format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	validates  :password, length: {minimum: 6}
	has_secure_password
end
