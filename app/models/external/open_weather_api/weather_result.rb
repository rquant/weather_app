module External
  module OpenWeatherApi
    class WeatherResult
      include ActiveModel::Model

      attr_accessor :zip_code,
                    :country,
                    :date,
                    :temp,
                    :min_temp,
                    :max_temp
    end
  end
end
