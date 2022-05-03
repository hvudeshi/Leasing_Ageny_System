require 'rails_helper'

RSpec.describe Property, type: :model do

  context 'validation tests' do

    it 'ensures name is present' do
      prop = Property.new(id: 1,property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures property_type is present' do
      prop = Property.new(id: 1,name: 'property 1', number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures number_of_units is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures agent is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures size is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures address is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures number_of_rooms is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures number_of_bathrooms is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures terms_available is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, earliest_start_date: 2021-10-19, application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures earliest_start_date is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', application_fee: 500, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures application_fee is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, monthly_rent: 1200, occupied_by: 1)
      expect(prop).to_not be_valid
    end

    it 'ensures monthly_rent is present' do
      prop = Property.new(id: 1,name: 'property 1', property_type: 'House' , number_of_units: 3, agent: 3, size: '1000', address: 'abc 1', parking: true, pet_allowed: false, number_of_rooms: 3, number_of_bathrooms: 3, laundry: true, terms_available: 'No terms', earliest_start_date: 2021-10-19, application_fee: 500, occupied_by: 1)
      expect(prop).to_not be_valid
    end

  end

end