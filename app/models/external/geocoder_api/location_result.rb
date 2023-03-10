module External
  module GeocoderApi
    class LocationResult
      include ActiveModel::Model

      attr_accessor :city,
                    :state,
                    :zip_code,
                    :country
    end
  end
end
