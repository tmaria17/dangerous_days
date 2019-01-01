class SearchFacade
  attr_reader :start_date, :end_date
  def initialize(params)
    @start_date = params["start_date"].to_s.to_datetime.strftime("%B %-d, %Y")
    @end_date = params["end_date"].to_s.to_datetime.strftime("%B %-d, %Y")
  end

  def most_dangerous_day
    hash = Hash.new(0)
    neos.each do |neo|
      neo[1].each do |space|
         hash[neo[0]] += 1 if space[:is_potentially_hazardous_asteroid]
      end
     end
    hash.max_by{|k,v| v}.first.to_s.to_datetime.strftime("%B %-d, %Y")
  end

  def neos
    service.get_neos
  end

  def service
    NasaService.new
  end
end
