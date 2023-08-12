class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name,  null: false, comment: "作業員"
      t.integer :group, null: false, comment: "所属会社"
      t.timestamps
    end
  end
end
