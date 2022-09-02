# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration > ItemAvailability`.  See https://schema.org/ItemAvailability
module SchemaDotOrg
  class ItemAvailability < Enumeration
    def initialize(type)
      @type = type.split('::').last
    end

    def _to_json_struct
      "https://schema.org/#{@type}"
    end
  end
end