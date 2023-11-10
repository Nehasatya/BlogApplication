class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|

      t.string :title
      t.references :topic , foreign_key: true
      t.timestamps
    end
  end
end
