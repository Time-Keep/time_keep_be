require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:county) }
    it { should validate_presence_of(:county_ascii) }
    it { should validate_presence_of(:county_full) }
    it { should validate_presence_of(:county_fips) }
    it { should validate_presence_of(:state_id) }
    it { should validate_presence_of(:state_name) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lon) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:county_unemployment_rate) }
    it { should validate_presence_of(:state_unemployment) }
    it { should validate_presence_of(:county_median_income) }
    it { should validate_presence_of(:tax_rate) }
  end
end
