class AddAuthorNameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :author_name, :string, null: false
  end
end
