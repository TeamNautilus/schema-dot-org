# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration > ItemAvailability :: LimitedAvailability`.  See https://schema.org/LimitedAvailability
module SchemaDotOrg
  class LimitedAvailability
    extend SchemaDotOrg::ItemAvailabilityType
  end
end