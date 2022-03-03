class Club
  attr_reader :book_id,
              :host_id,
              :name,
              :id


  def initialize(data)
    @id = data[:data][:id]
    @name = data[:data][:attributes][:name]
    @book_id = data[:data][:attributes][:book_id]
    @host_id = data[:data][:attributes][:host_id]
  end
end
