class CreateAdvertisments < ActiveRecord::Migration[6.0]
  def change
    create_table :advertisments do |t|
      t.string :linkimg
      t.boolean :visible

      t.timestamps
    end
  end
end
