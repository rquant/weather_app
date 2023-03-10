# frozen_string_literal: true

module External
  class OpenWeatherApi

    attr_reader :api_key

    def initialize(api_key = Rails.application.credentials.open_weather_api_key)
      @api_key = api_key
    end

    def current_weather(zip_code, country: 'US')
      weather = client.current_weather(zip: zip_code, country: country)
      weather_main = weather.main
      WeatherResult.new(
        zip_code: zip_code,
        date: weather.dt,
        temp: weather_main.temp,
        min_temp: weather_main.temp_min,
        max_temp: weather_main.temp_max
      )
    rescue Faraday::ResourceNotFound => e
      code = e.response.dig(:body, :code)
      message = e.response.dig(:body, :message)
      raise Error.new(code, message)
    end

    private

    def client
      @client ||= OpenWeather::Client.new(api_key: api_key)
    end
  end
end
