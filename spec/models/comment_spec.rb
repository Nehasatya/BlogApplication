require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject{
    described_class.new(com_description: "This is com_description",post_id:1)
  }

  it 'is valid with com_description' do
    expect(subject).to be_valid
  end

  it 'is not valid without com_description' do
    comment = Comment.create(com_description: nil)
    expect(comment).to be_invalid
  end
end
