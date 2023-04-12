class Authors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, index {unique: true, name: 'unique_author_names'}
      t.text :bio

      t.timestamps
    end
  end
end
