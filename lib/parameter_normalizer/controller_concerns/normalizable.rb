module ParameterNormalizer
  module ControllerConcerns
    module Normalizable
      extend ActiveSupport::Concern

      def parameter_normalizer
        @parameter_normalizer ||= ParameterNormalizer::Normalizer.new
      end
    end
  end
end
