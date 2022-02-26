require 'rails_helper'

RSpec.describe Club do
  it "exists and has attributes" do
    data = { book_id: 1,
             host_id: 12,
             user_id: 5 #maybe we need but also easy delete
           }
    club = Club.new(data)
    expect(club).to be_a(Club)
    expect(club.book_id).to eq(1)
    expect(club.host_id).to eq(12)
    expect(club.user_id).to eq(5)
  end
end
