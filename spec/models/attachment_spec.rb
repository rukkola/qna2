require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it { should belong_to :attachmentable } # :attachmentable - полиморфный столбец. В название добавляется "...able"
end
