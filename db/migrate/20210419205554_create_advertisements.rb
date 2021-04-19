class CreateAdvertisements < ActiveRecord::Migration[6.0]
  def change
    create_table :advertisements do |t|
      t.string :link
      t.string :img
      t.string :publish
      t.boolean :visable

      t.timestamps
    end
  end
end
