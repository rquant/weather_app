module External
  module GeocoderApi
    class InvalidAddressError < StandardError
      attr_reader :message

      MESSAGE = 'Geolocation for address provided could not be resolved'.freeze

      def initialize
        @message = MESSAGE
        super(message)
      end
    end
  end
end
