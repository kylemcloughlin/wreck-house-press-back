class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitles
      t.string :author
      t.string :photos
      t.string :body
      t.references :categorization, null: false, foreign_key: true
      t.references :subcategorization, null: true, foreign_key: true

      t.timestamps
    end
  end
end
