class List < ApplicationRecord

    belongs_to :user
    belongs_to :category
    has_many :items
    accepts_nested_attributes_for :category, reject_if: :all_blank 
    validates :name, presence: true
    scope :sort_list, -> { List.order(description: :desc) }

end
