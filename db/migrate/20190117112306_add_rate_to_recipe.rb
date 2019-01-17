class AddRateToRecipe < ActiveRecord::Migration[5.2]
  def change
  	add_column :recipe, :overall_rate, :integer
  end
end
