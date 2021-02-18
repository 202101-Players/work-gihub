class Item < ApplicationRecord
  belongs_to :admin
  
  belongs_to :genre  #admin側商品で追加
  attachment :image
end
