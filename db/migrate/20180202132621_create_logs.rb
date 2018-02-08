class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
