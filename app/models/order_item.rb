class OrderItem < ActiveRecord::Base
  belongs_to :order
  has_many :books
end
