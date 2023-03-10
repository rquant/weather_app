module External
  module OpenWeatherApi
    class ApiError < StandardError
      attr_reader :code, :message

      def initialize(code, message)
        @code = code
        @message = message
        super(message)
      end
    end
  end
end
