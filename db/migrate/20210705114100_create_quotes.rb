class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :label, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
