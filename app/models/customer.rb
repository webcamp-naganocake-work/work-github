class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  has_many :orders
  has_many :addresses
  
  def full_name
    self.last_name + " " + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end
  
  def address_display
    '〒' + postal_code + ' ' + address
  end
  
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
