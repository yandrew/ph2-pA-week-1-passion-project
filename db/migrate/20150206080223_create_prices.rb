class CreatePrices < ActiveRecord::Migration
  def change
  	create_table :prices do |t|
  		t.string :cost

  		t.integer :car_id
  		t.integer :user_id
  		
  		t.timestamps
  	end
  end
end
