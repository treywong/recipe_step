class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :user
    	t.string :name
    	t.string :description
    	t.string :cooktime
    	t.string :tags, array: true, default: []
    	t.string :ingredients, array: true, default: []
    	t.string :instruction
    	t.string :images, array: true, default: []
      t.timestamps
    end
  end
end
