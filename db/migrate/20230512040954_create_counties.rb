class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :name
      t.string :county_full
      t.string :fips
      t.string :lat
      t.string :lon
      t.string :population
      t.string :unemployment_rate
      t.string :median_income
      t.string :tax_rate
      t.integer :establishment_count, default: 0
      t.integer :annual_wages, default: 0
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
