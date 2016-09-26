require 'rails_helper'

describe Developer, type: :model do
  # :name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:name).is_at_most(250) }

  # :age
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).only_integer }
  it { is_expected.to validate_numericality_of(:age).is_greater_than(1) }
  it { is_expected.to validate_numericality_of(:age).is_less_than_or_equal_to(150) }
end
