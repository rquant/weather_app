module External
  class GeocoderApi
    class << self
      def geocode_address(address_str)
        results = Geocoder.search(address)
        raise InvalidAddressError if results.count == 0
        raise AmbiguousAddressError if results.count > 0
        address_result = results.first.data['address']

        LocationResult.new(
          city: address_result['town'],
          state: address_result['state'],
          zip_code: address_result['postcode'],
          country: address_result['country'],
        )
      end
    end
  end
end
