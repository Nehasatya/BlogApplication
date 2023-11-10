require 'rails_helper'

RSpec.describe Topic, type: :model do

  subject {described_class.new}

it 'is valid with valid title'  do
  subject.title = "Hi this is title!!"
  expect(subject).to be_valid
end

it 'is invalid without title' do
  topic = Topic.new(title:nil)
  expect(topic).to_not be_valid
end

end