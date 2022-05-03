require 'rails_helper'

describe 'Property' do
  it 'testing test case' do
    prop = Property.new
    prop.occupied_by = 1
    expect(prop).to_not be_valid
  end
end