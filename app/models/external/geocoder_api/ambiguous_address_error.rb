module External
  module GeocoderApi
    class AmbiguousAddressError < StandardError
      attr_reader :message

      MESSAGE = 'Geolaction for address provided yields ambiguous results'.freeze

      def initialize
        @message = MESSAGE
        super(message)
      end
    end
  end
end
