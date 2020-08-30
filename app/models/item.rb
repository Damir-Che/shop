class Item < ApplicationRecord

  #{ numericality: { greater_than: 0 } }, цена должна быть больше 0
  # , allow_nil: true - цена может быть пустой
  validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :name, :description, presence: true

  has_and_belongs_to_many :carts
end
