require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it 'ensures first name presence' do
      user = User.new(last_name: 'Last', email: 'anjali@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new(first_name: 'First', email: 'anjali@gmail.com').save
      expect(user).to be(false)
    end

    it 'ensures email presence' do
      user = User.new(first_name: 'First', last_name: 'Last').save
      expect(user).to eq(false)
    end

    it 'should save Successfully' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'anjali@gmail.com').save
      expect(user).to be(true)
    end
  end

  context 'scope tests' do
    let (:params) { {first_name: 'Fisrt', last_name: 'Last', email: 'anjali@gmail.com'} }
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params).save
      User.new(params.merge(active: false)).save
      User.new(params.merge(active: false)).save
    end

    it 'should return active users' do
      expect(User.active_users.size).to eq(3)
    end

    it 'should return inactive users' do
      expect(User.inactive_users.size).to eq(2)
    end

  end
end
