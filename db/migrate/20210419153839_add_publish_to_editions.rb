class AddPublishToEditions < ActiveRecord::Migration[6.0]
  def change
    add_column :editions, :publish, :string
  end
end
