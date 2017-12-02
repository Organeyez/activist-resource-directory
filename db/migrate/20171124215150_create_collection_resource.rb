class CreateCollectionResource < ActiveRecord::Migration[5.1]
  def change
    create_table :collection_resources do |t|
    	t.references			:collection, null: false
    	t.references			:resource, null: false

    	t.timestamps 
    end
  end
end
