class Genre < ApplicationRecord
  has_many :item, dependent: :destroy  #admin側商品で追加
end
