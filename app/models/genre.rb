class Genre < ApplicationRecord
  has_many :item, dependent: :destroy  #admin側商品で追加
  belongs_to :admin, optional: true
end
