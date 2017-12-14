require 'rails_helper'

describe Review do
  it { should belong_to :meal }
  it { should validate_presence_of :content }
  it { should validate_presence_of :author }
end
