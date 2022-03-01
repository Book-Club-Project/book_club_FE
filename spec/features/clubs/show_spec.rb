require 'rails_helper'

RSpec.describe 'Club show page' do
  it "checks that page exists " do
    visit("/bookclub/1")
  end
end
