class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_many :reviews

  def as_json(options = {})
    super(options.merge({ include: { authors: { only: %i[id name bio] } } }))
  end
end
