class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
