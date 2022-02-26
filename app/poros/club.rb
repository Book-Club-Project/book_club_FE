class Club
  attr_reader :book_id,
              :host_id,
              :user_id
  def initialize(data)
    @book_id = data[:book_id]
    @host_id = data[:host_id]
    @user_id = data[:user_id]
  end
end
