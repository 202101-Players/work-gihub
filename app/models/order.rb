class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  enum status:{ waiting_for_payment: 0, payment_confirmation:1, production:2, ready_to_ship:3, sent:4 }
  enum payment_method: {銀行振込:1, クレジットカード:0}

end
