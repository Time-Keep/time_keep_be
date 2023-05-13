require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:abbrev) }
    it { should validate_presence_of(:unemp_rate) }
    it { should validate_presence_of(:tax_rate) }
  end

  describe 'relationships' do
    it { should have_many :counties }
  end
end
