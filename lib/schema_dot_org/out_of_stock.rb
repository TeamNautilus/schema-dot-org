# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration > ItemAvailability :: OutOfStock`.  See https://schema.org/OutOfStock
module SchemaDotOrg
  class OutOfStock
    extend SchemaDotOrg::ItemAvailabilityType
  end
end