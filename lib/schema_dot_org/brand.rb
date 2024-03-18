# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Brand`.  See https://schema.org/Brand
#
module SchemaDotOrg
  class Brand < Thing
    attr_accessor :logo,
                  :aggregate_rating

    validates :aggregate_rating, type: SchemaDotOrg::AggregateRating, allow_nil: true

    def _to_json_struct
      output_logo = self.logo.is_a?(String) ? self.logo : self.logo&.to_json_struct
      super.merge({
                    "aggregateRating" => aggregate_rating&.to_json_struct,
                    "logo" => output_logo
                  })
    end
  end
end
