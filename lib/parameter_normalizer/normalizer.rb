module ParameterNormalizer
  class Normalizer
    def as_integer(value)
      Integer(value)
    rescue StandardError
      nil
    end

    def as_integer_array(value)
      Array(value).filter_map do |record|
        as_integer(record)
      end
    end

    def as_integer_hash(value)
      {}.tap do |results|
        next if value.blank?

        value.each do |k, v|
          results[k] = as_integer(v)
        end
      end
    end

    def as_boolean(value)
      return true if value.in?(['1', 1, true, 'true'])

      false
    end

    def as_datetime(value)
      return if value.blank?

      Time.zone.parse(value)
    rescue StandardError
      nil
    end

    def as_date(value)
      return if value.blank?

      datetime = Time.zone.parse(value)
      datetime.to_date
    rescue StandardError
      nil
    end
  end
end
