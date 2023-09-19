require 'rails_helper'

RSpec.describe Post, type: :model do

  subject {
    described_class.new(title: 'title',
                        description: 'desp',
                        author_name: 'neha',
                        topic_id: 1)
  }

  it 'is valid with valid title' do
    expect(subject).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(title:nil,description:"desp",author_name:"auth_name")
    expect(post).to be_invalid
  end

  it 'is valid with a description' do
    expect(subject).to be_valid
  end

  it 'is invalid without a description' do
    post = Post.new(title:"tit",description:nil,author_name:"neha")
    expect(post).to be_invalid
  end

  it 'is valid with a author name' do
    expect(subject).to be_valid
  end

  it 'is invalid without an author name' do
    post = Post.new(title: "tit",description: "desp",author_name:nil)
    expect(post).to_not be_valid
  end

end
