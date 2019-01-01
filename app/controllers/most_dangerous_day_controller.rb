class MostDangerousDayController < ApplicationController
  def index
    @search_facade = SearchFacade.new(params)
  end
end
