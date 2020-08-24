require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Question, type: :model do
  
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

=begin Вышке тоже самое, но с приминением gem 'shoulda-matchers' 
  it 'valid title' do
  	  expect(Question.new(body: '123')).to_not be_valid
  end

  it 'valid body' do
  	expect(Question.new(title: '123')).to_not be_valid	
  end
=end
end

