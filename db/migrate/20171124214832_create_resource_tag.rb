class CreateResourceTag < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_tags do |t|
    	t.references			:resource, null: false
    	t.references			:tag, null: false

    	t.timestamps 
    end
  end
end
