class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name,  null: false
      t.integer :group, null: false
      t.timestamps
    end
  end
end
