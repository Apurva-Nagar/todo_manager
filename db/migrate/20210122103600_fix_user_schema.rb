class FixUserSchema < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :password
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :password_digest, :string
      t.timestamps
    end
  end
end
