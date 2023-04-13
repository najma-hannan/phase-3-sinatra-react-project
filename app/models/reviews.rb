class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def as_json(options = {})
    super(options.merge({ include: { user: { only: %i[id name email] } } }))
  end
end
