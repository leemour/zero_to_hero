class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :body
      t.string :title
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
