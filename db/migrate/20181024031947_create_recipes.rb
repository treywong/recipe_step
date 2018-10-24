class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
    	t.string :tags, array: true, default: []
    	t.string :ingredients, array: true, default: []
    	t.string :steps, array: true, default: []
    	t.string :image

      t.timestamps
    end
  end
end
