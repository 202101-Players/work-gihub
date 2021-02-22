class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  enum payment_method: {銀行振込:1, クレジットカード:0}
end
