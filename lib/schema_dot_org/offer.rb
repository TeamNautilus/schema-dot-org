# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Offer`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class Offer < Thing
    attr_accessor :price_currency,
                  :price,
                  :availability,
                  :seller

    validates :price_currency,       type: String
    validates :price,               type: Numeric, allow_nil: true
    validates :availability,        type: SchemaDotOrg::ItemAvailability, allow_nil: true
    validates :seller,              type: SchemaDotOrg::LocalBusiness, allow_nil: true

    def _to_json_struct
      super.merge({
          "price" => price,
          "priceCurrency" => price_currency,
          "availability" => availability&._to_json_struct,
          "seller" => seller&.to_json_struct,
      })
    end
  end
end
