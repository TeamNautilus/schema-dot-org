# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Rating`.  See https://schema.org/Rating
#
module SchemaDotOrg
  class AggregateRating < Rating
    attr_accessor :review_count, :rating_count

    validates :review_count, type: Integer, allow_nil: true
    validates :rating_count, type: Integer, allow_nil: true

    def _to_json_struct
      super.merge({
                    "reviewCount" => review_count,
                    "ratingCount" => rating_count
                  })
    end

  end
end
