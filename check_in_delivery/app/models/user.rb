class User < ActiveRecord::Base
    has_secure_password
    has_many :deliveries 
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
