class CreateCollection < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
    	t.string			:name, null: false 
    	t.references		:owner, null: false

    	t.timestamps
    end
  end
end
