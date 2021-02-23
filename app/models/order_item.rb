class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
   enum making_status:{ non: 0, stop:1, ing:2, finish:3 }

  # (0:制作不可、1:制作待ち、2:制作中、3:製作完了)
end
