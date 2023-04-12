class Books < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, index {unique: true, name: 'unique_book_titles'}
      t.text :description
      t.date :date_of_publication
      t.integer :quantity
      t.integer :price
      
      t.timestamps
    end
  end
end
