require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is invalid without username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'has many posts' do
    expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
  end
end
