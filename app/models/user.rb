class User < ActiveRecord::Base
  include BCrypt

  has_many :orders
  has_many :order_items
  has_many :reviews

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def generate_token!
    self.token = SecureRandom.urlsafe_base64(64)
    self.save!
  end

  def as_json(options = {})
    super(options.merge(except: [:password_hash]))
  end
end
