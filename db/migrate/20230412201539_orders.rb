class Orders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
