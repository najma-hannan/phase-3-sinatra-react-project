class Reviews < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order
      t.text :comment
      t.integer :rating
      
      t.timestamps
    end
  end
end
