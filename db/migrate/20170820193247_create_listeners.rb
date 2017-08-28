class CreateListeners < ActiveRecord::Migration[5.0]
  def change
    create_table :listeners do |t|
      t.string :age, null: false
      t.string :gender, null: false
      t.boolean :on_campus?

      t.timestamps
    end
  end
end
