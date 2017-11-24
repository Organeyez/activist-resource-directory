class CreateFavorite < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
    	t.references			:resource, null: false
    	t.references			:fan, null: false

    	t.timestamps
    end
  end
end
