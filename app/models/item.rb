class Item < ApplicationRecord

  belongs_to :genre, optional: true  #admin側商品で追加

  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order
end
