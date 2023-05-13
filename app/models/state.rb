class State < ApplicationRecord
  validates :name,
            :abbrev,
            :unemp_rate,
            :tax_rate,
            presence: true

  has_many :counties
end
