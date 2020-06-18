class List < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :list_items
    has_many :items, through: :list_items
    accepts_nested_attributes_for :category
end
