class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :period
      t.string :dis
      t.string :validUntil
      t.string :includes
      t.string :foot
      t.integer :cost
      t.string :stripe
      t.timestamps
    end
  end
end
