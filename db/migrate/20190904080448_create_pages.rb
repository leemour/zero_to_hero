class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :title
      t.text :body
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
