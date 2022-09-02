# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration > ItemAvailability :: PreSale`.  See https://schema.org/PreSale
module SchemaDotOrg
  class PreSale
    extend SchemaDotOrg::ItemAvailabilityType
  end
end