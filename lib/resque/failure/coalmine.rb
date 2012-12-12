module Resque
  module Failure
    class Coalmine < Base
      def self.configure(&block)
        ::Coalmine.configure(&block)
      end

      def self.count
        # We can't get the total # of errors from Coalmine so we fake it
         # by asking Resque how many errors it has seen.
        Stat[:failed]
      end

      def save
        ::Coalmine.custom_variables[:payload_class] = payload['class']
        ::Coalmine.custom_variables[:payload_args]  = payload['args'].inspect
        ::Coalmine.notify(exception)
      end
    end
  end
end
