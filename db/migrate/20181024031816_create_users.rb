class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :email
    	t.string :password
    	t.string :password_digest
    	t.string :role, default: "regular"
    	t.string :image_profile
      t.timestamps
    end
  end
end
