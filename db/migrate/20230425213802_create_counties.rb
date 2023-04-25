class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :county
      t.string :county_ascii
      t.string :county_full
      t.string :county_fips
      t.string :state_id
      t.string :lat
      t.string :lng
      t.string :population
      t.string :county_unemployment_rate
      t.string :state_unemployment
      t.string :county_median_income
      t.string :tax_rate
      t.string :establishment_count

      t.timestamps
    end
  end
end
