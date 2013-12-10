require 'spec_helper'

describe Sak do
  let(:sak) { build(:sak) }

  it { should be_valid(:sak) }
  it { should embed_many(:items) }

end
