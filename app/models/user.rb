class User < ActiveRecord::Base
  has_many :orders
  has_many :order_items
  has_many :reviews
end
