class SearchFacade
  attr_reader :start_date, :end_date
  def initialize(params)
    @start_date = params["start_date"].to_s.to_datetime.strftime("%B %-d, %Y")
    @end_date = params["end_date"].to_s.to_datetime.strftime("%B %-d, %Y")
  end

  def most_dangerous_day

  end

  def neos
  end

  def service
    NasaService.new
  end
end
