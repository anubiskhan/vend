require 'rails_helper'

describe Snack do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:price)}
  end

  describe 'relationships' do
    it {is_expected.to have_many(:machines).through(:machine_snacks)}
  end
end
