class NasaService
  def get_neos
    get_json("/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07")[:near_earth_objects]
  end
  private
    def conn
      url = "https://api.nasa.gov"
      Faraday.new(url: url ) do |faraday|
        faraday.params["api_key"] = ENV["NASA_KEY"]
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
