class Category < ApplicationRecord
    has_many :lists
    has_many :users, through: :lists  
    validates :name, presence: true
    # validates_uniqueness_of :name

    
end
