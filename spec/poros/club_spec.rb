require 'rails_helper'

RSpec.describe Club do
  it "exists and has attributes" do
    data = { data: {attributes: {book_id: 1,
             host_id: 12,
             name: 'Hi'
           }}}
    club = Club.new(data)
    expect(club).to be_a(Club)
    expect(club.book_id).to eq(1)
    expect(club.host_id).to eq(12)
    expect(club.name).to eq('Hi')
  end
end
