# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration > ItemAvailability :: InStock`.  See https://schema.org/InStock
module SchemaDotOrg
  class InStock
    extend SchemaDotOrg::ItemAvailabilityType
  end
end