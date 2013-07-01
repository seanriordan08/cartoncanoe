class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :email
      t.integer :time, :precision => 3
      t.integer :money, :precision => 3
      t.integer :allergy, :precision => 3

      t.timestamps
    end
  end
end
