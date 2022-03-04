class Club
  attr_reader :id,
              :name,
              :book_id,
              :host_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @book_id = data[:attributes][:book_id]
    @host_id = data[:attributes][:host_id]
  end
end
