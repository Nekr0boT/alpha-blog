class User < ActiveRecord::Base
	has_many :articles
	before_save { self.email = email.downcase! }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, :email, presence: true,
						uniqueness: { case_sensitive: false }

	validates :username, length: { minimum: 3, maximum: 25 }

	validates :email, format: { with: VALID_EMAIL_REGEX },
						length: { maximum: 105 }
end