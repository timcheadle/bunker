require 'rails_helper'

RSpec.describe Bottle, :type => :model do
  let(:bottle) { build(:bottle) }

  it 'should have a valid factory' do
    expect(bottle).to be_valid
  end

  it { expect(bottle).to validate_presence_of(:name) }

  it { expect(bottle).to validate_presence_of(:spirit) }
  it { expect(bottle).to validate_inclusion_of(:spirit).in_array(%w(bourbon rye scotch)) }

  it { expect(bottle).to validate_presence_of(:volume) }
  it { expect(bottle).to validate_numericality_of(:volume).only_integer }
  it { expect(bottle).to validate_numericality_of(:volume).is_greater_than(0) }

  it { expect(bottle).to validate_presence_of(:proof) }
  it { expect(bottle).to validate_numericality_of(:proof).is_greater_than(0) }
  it { expect(bottle).to validate_numericality_of(:proof).is_less_than_or_equal_to(200) }

  it { expect(bottle).to validate_numericality_of(:released).allow_nil }
  it { expect(bottle).to validate_numericality_of(:released).only_integer }
  it { expect(bottle).to validate_numericality_of(:released).is_greater_than(1700) }

  it { expect(bottle).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { expect(bottle).to validate_numericality_of(:score).allow_nil }
  it { expect(bottle).to validate_numericality_of(:score).only_integer }
  it { expect(bottle).to validate_numericality_of(:score).is_greater_than_or_equal_to(0) }
  it { expect(bottle).to validate_numericality_of(:score).is_less_than_or_equal_to(100) }
end
