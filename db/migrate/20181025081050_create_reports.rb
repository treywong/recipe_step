class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
    	t.references :user
    	t.string :description
    	t.string :origin
      t.timestamps
    end
  end
end
