class Quote

  attr_reader :author,
              :quote

  def initialize(data)
    @author = data[:attributes][:author]
    @quote = data[:attributes][:quote]
  end

end
