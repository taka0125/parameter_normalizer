require 'parameter_normalizer/controller_concerns/normalizable'

module ParameterNormalizer
  class Railtie < ::Rails::Railtie
    initializer 'parameter_normalizer.controller_concerns' do
      ActiveSupport.on_load(:action_controller_base) do
        include ParameterNormalizer::ControllerConcerns::Normalizable
      end
    end
  end
end
