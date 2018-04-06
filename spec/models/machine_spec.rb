require 'rails_helper'

describe Machine do
  describe 'validations' do
    it {should validate_presence_of(:location)}
  end

  describe 'relationships' do
    it {is_expected.to have_many(:snacks).through(:machine_snacks)}
    it {is_expected.to belong_to(:owner)}
  end
end
