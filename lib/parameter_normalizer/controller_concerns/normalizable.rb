module ParameterNormalizer
  module ControllerConcerns
    module Normalizable
      extend ActiveSupport::Concern

      def parameter_normalizer
        @parameter_normalizer ||= ParameterNormalizer::Normalizer.new
      end

      def normalize_parameter(key, method, target: nil, skip_key_not_found: true)
        target ||= params

        if skip_key_not_found
          return unless target.key?(key)
        end

        target[key] = parameter_normalizer.public_send(method, target[key])
      end
    end
  end
end
