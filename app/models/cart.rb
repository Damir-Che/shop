class Cart < ApplicationRecord
  belongs_to :user
  has_many   :positions #связь THROUGH
  has_many   :items, through: :positions#связь THROUGH

end
