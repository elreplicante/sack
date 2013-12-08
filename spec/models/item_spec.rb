require 'spec_helper'

describe Item do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
