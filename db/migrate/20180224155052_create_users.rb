class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.boolean :is_admin, default: false
      t.boolean :clocked_in, default: false
    end
  end
end
