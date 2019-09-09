require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  it 'is invalid without title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is invalid without article' do
    post.article = nil
    expect(post).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'belongs to user' do
    expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
end
