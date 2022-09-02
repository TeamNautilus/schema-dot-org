# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg::ItemAvailabilityType
  def item
    SchemaDotOrg::ItemAvailability.new(name)
  end
end