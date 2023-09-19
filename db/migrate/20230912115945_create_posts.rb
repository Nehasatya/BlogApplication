class CreatePosts < ActiveRecord::Migration[6.1]
  def change

    create_table :posts do |t|

      t.string :title
      t.text :description
      t.string :author_name
      t.integer :topic_id
      t.references :post , foreign_key: true

      t.timestamps
    end
  end
end

