class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def as_json(options = {})
    super(
      options.merge(
        include: {
          user: {
            only: %i[id name email]
          },
          order_items: {
            only: %i[id quantity price],
            include: {
              book: {
                only: %i[id title date_of_publication]
              }
            }
          }
        }
      )
    )
  end
end
