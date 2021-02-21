class Item < ApplicationRecord
  belongs_to :admin, optional: true
  
  belongs_to :genre, optional: true  #true側商品で追加
  attachment :image
end
