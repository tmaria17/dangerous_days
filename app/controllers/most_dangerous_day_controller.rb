class MostDangerousDayController < ApplicationController
  def index
    # require 'pry'
    # binding.pry
    @search_facade = SearchFacade.new(params)
  end
end
