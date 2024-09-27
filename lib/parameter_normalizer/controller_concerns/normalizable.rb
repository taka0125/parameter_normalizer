module ParameterNormalizer
  module ControllerConcerns
    module Normalizable
      extend ActiveSupport::Concern

      def parameter_normalizer
        @parameter_normalizer ||= ParameterNormalizer::Normalizer.new
      end

      def normalize_parameter(key, method, skip_key_not_found: true)
        if skip_key_not_found
          return unless params.key?(key)
        end

        params[key] = parameter_normalizer.public_send(method, params[key])
      end
    end
  end
end
