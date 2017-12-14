require 'rails_helper'

describe Meal do
  it { should have_many :reviews }
  it { should validate_presence_of :dish }
  it { should validate_presence_of :drink }
  it { should validate_presence_of :rating }
end
