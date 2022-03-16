require 'rails_helper'

RSpec.describe NytBook do
  let(:data) {
    {
      :rank=>2,
      :rank_last_week=>0,
      :weeks_on_list=>1,
      :asterisk=>0,
      :dagger=>0,
      :primary_isbn10=>"1982166797",
      :primary_isbn13=>"9781982166793",
      :publisher=>"Atria",
      :description=>"During a summer trip in Italy, Katy’s late mother reappears as a 30-year-old woman.",
      :price=>"0.00",
      :title=>"ONE ITALIAN SUMMER",
      :author=>"Rebecca Serle",
      :contributor=>"by Rebecca Serle",
      :contributor_note=>"",
      :book_image=>"https://storage.googleapis.com/du-prd/books/images/9781982166793.jpg",
      :book_image_width=>324,
      :book_image_height=>500,
      :amazon_product_url=>"https://www.amazon.com/dp/1982166797?tag=NYTBSREV-20",
      :age_group=>"",
      :book_review_link=>"",
      :first_chapter_link=>"",
      :sunday_review_link=>"",
      :url=>
      "https://du-gae-books-dot-nyt-du-prd.appspot.com/redirect?url1=https%3A%2F%2Fbookshop.org%2Fa%2F3546%2F9780063003057&url2=https%3A%2F%2Fbookshop.org%2Fbooks%3Faffiliate%3D3546%26keywords%3DTHE%2BPARIS%2BAPARTMENT"
    }
  }

  let(:book) { NytBook.new(data) }

  it 'exists with attributes' do
    expect(book).to be_a NytBook

    expect(book.rank).to eq(2)
    expect(book.title).to eq("ONE ITALIAN SUMMER")
    expect(book.author).to eq("Rebecca Serle")
    expect(book.description).to eq("During a summer trip in Italy, Katy’s late mother reappears as a 30-year-old woman.")
    expect(book.isbn).to eq("1982166797")
    expect(book.image).to eq("https://storage.googleapis.com/du-prd/books/images/9781982166793.jpg")
  end
end
