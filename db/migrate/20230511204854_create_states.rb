class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbrev
      t.string :unemp_rate, default: 0
      t.string :tax_rate, default: 0

      t.timestamps
    end
  end
end
