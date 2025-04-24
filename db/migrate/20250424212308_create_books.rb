class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :language
      t.integer :quantity
      t.timestamps
    end
  end
end
