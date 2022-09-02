# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `Thing > Intangible > Enumeration`.  See https://schema.org/Enumeration
module SchemaDotOrg
  class Enumeration < Intangible
  end
end