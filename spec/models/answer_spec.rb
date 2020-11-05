require 'rails_helper'

RSpec.describe Answer, type: :model do
  #it { should have_many :answers } # непонятно зачем это

  it { should belong_to :question }
  it { should validate_presence_of :body }
end
