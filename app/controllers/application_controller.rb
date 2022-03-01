class ApplicationController < ActionController::Base

  def quote
    @quote = QuoteFacade.get_quote
  end
end
