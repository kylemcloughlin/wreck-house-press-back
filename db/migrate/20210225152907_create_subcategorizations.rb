class CreateSubcategorizations < ActiveRecord::Migration[6.0]
  def change
    create_table :subcategorizations do |t|
      t.string :name
      t.references :categorization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
