# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  order_number     :string           not null
#  street_address   :string           not null
#  street_address_2 :string
#  city             :string           not null
#  state            :string           not null
#  zipcode          :string           not null
#  country          :string           not null
#  phone_number     :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#

class Order < ActiveRecord::Base
  belongs_to :user

  before_validation :generate_order_number
  after_commit :charge_payment

  validates_presence_of :order_number, :street_address, :city, :state, :zipcode, :country, :phone_number, :user_id

  def charge_payment
    
  end

  private

  def generate_order_number
    self.order_number = SecureRandom.hex(3) + '-' + SecureRandom.hex(4) + '-' + SecureRandom.hex(3)
  end
end
