class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { credit_card: 0,transfer: 1 }
  enum order_status: { waiting: 0, confirmation: 1, making: 2, preparing: 3, deliverd: 4 }
  
end
