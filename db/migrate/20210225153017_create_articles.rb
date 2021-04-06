class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitles
      t.string :author
      t.string :photos, array: true, default: []
      t.string :fallback, array: true, default: []
      t.string :body, array: true, default: []
      t.boolean :breaking
      t.string :rt
      t.string :legacy
      t.string :originalPost
      t.string :url
      t.references :categorization, null: false, foreign_key: true
      t.references :subcategorization, null: true, foreign_key: true

      t.timestamps
    end
  end
end
