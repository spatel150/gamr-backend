class Game < ApplicationRecord
    has_many :users, through: :purchases
    has_many :purchases
end
