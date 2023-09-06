class Widget < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true
end
