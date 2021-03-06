# encoding: utf-8
require 'base64'

require 'fluent/filter'

module Fluent
  class Base64DecodeFilter < Filter
    Plugin.register_filter('base64_decode', self)

    def initialize
      super
    end

    config_param :fields, :array, value_type: :string

    def configure(conf)
      super
    end

    def filter(tag, time, record)
      @fields.each { |key|
        record[key] = Base64.decode64(record[key]) if record.has_key? key
      }
      record
    end

  end if defined?(Filter) # Support only >= v0.12
end
