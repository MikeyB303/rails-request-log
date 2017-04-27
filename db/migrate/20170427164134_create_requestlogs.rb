class CreateRequestlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :requestlogs do |t|
      t.string :month, null: false
      t.string :year, null: false

      t.timestamps
    end
  end
end
