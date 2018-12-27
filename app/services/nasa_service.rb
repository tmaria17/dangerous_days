class NasaService


  def get_neos
    get_json("neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07&api_key=#{ENV['NASA_KEY']}")
  end
  private
    def get_json
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end

    def conn
      url = "https://api.nasa.gov"
      Faraday.new(url: url ) do |faraday|
        faraday.adapter Faraday.deafault_adapter
      end
    end
end
