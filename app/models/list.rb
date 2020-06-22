class List < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :items
    accepts_nested_attributes_for :category
    

end
