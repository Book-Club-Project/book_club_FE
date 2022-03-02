class Quote

  attr_reader :author,
              :quote

  def initialize(data)
    # require "pry"; binding.pry
    @author = data[:attributes][:author]
    @quote = data[:attributes][:quote]
  end

end
