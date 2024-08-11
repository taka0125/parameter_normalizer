# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'

require_relative "parameter_normalizer/version"
require_relative "parameter_normalizer/normalizer"
require_relative "parameter_normalizer/railtie" if defined?(::Rails::Railtie)

module ParameterNormalizer
  class Error < StandardError; end
end
