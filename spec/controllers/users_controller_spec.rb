require 'rails_helper'

RSpec.describe User, type: :model do

  context 'POST#create_user' do
    it 'tests if a new user is created' do
      user1 = User.create(user_id: 100, name: 'applicant', email_address: 'abc@123456.com', password_digest: 'abc', user_type: 'Applicant', address: 'abc', phone_number: '123')
      expect(User.last.email_address).to eq('abc@123456.com')
    end
  end
end