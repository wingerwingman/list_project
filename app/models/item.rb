class Item < ApplicationRecord
    belongs_to :list
    validates :description, presence: true
    scope :long_items, -> {where("LENGTH(items.list_id) > 10")}
end
