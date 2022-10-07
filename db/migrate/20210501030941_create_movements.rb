class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.string :description
      t.date :issue_date
      t.integer :net
      t.integer :total_iva
      t.integer :amount
      t.string :countable_type
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
