# frozen_string_literal: true

require 'schema_dot_org'


module SchemaDotOrg
  # Model the Schema.org `Person`.  See http://schema.org/Person
  class Person < SchemaType
    attr_accessor :name, :url
    validates :name, type: String, presence: true
    validates :url, type: String, allow_nil: true


    def _to_json_struct
      {
        'url' => url,
        'name' => self.name
      }
    end
  end
end
