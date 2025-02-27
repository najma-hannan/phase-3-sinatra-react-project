class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true, name: "unique_emails" }
      t.string :password_hash
      t.string :token

      t.timestamps
    end
  end
end
