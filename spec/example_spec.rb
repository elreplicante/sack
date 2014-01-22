require 'spec_helper.rb'
require_relative '../sack.rb'

describe 'testing my app' do
  it 'works' do
    visit '/'
    expect(page).to have_content 'Sack'
  end
end
