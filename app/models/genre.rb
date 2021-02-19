class Genre < ApplicationRecord
  has_many :item  #admin側商品で追加
  belongs_to :admin
end
