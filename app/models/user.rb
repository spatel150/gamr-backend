class User < ApplicationRecord
    has_many :purchases
    has_many :games, through: :purchases

    has_secure_password

    
    validates :username, presence: true

end


