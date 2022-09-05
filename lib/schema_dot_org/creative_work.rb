# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > CreativeWork`.  See https://schema.org/CreativeWork
#
module SchemaDotOrg
  class CreativeWork < Thing
    attr_accessor :date_published, :author, :publisher, :offers, :headline

    validates :date_published,         type: Date, allow_nil: true
    validates :author,                 type: Person, allow_nil: true
    validates :publisher,                 type: Thing, allow_nil: true
    validates :offers,                      type: Array, allow_nil: true

    def _to_json_struct
      super.merge({
                      "headline" => headline,
                      "offers" => offers&.map(&:to_json_struct),
                      "datePublished" => date_published&.iso8601,
                      "author" => author&.to_json_struct,
                      "publisher" => publisher&.to_json_struct
                  })
    end
  end
end
