class CreateEnterprises < ActiveRecord::Migration[6.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :business_name
      t.integer :rut
      t.integer :dv
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
