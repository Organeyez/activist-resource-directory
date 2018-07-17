class AddAuthorAndTypeToResourcesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :author, :string
    add_column :resources, :type, :string
  end
end
