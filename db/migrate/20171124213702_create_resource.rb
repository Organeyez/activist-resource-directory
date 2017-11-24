class CreateResource < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
    	t.string			:title, null: false
    	t.text				:url, default: "There is no link attached to this resource"
    	t.text				:description, null: false 
    	t.references		:author, null: false 
    	t.references		:category, null:false

    	t.timestamps  
    end
  end
end
