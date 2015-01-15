require 'rails_helper'

RSpec.describe Bottle, :type => :model do
  let(:bottle) { build(:bottle) }

  it 'should have a valid factory' do
    expect(bottle).to be_valid
  end

  it { expect(bottle).to validate_presence_of(:name) }
  it { expect(bottle).to validate_uniqueness_of(:name).case_insensitive }

  it { expect(bottle).to validate_presence_of(:type) }
  it { expect(bottle).to validate_presence_of(:volume) }
  it { expect(bottle).to validate_presence_of(:proof) }
end
