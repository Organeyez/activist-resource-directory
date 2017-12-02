class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.text				:message, null: false
    	t.integer			:evidence_rating, null: false
    	t.integer			:useful_rating, null: false
    	t.integer			:detail_rating, null: false
    	t.integer			:recommend_rating, null: false
    	t.references		:author, null: false
    	t.references		:resource, null: false 

    	t.timestamps 
    end
  end
end
