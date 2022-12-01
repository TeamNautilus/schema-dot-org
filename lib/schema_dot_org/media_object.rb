# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `CreativeWork > MediaObject`.  See https://schema.org/MediaObject
#
module SchemaDotOrg
  class MediaObject < CreativeWork
    attr_accessor :contentUrl

    validates :contentUrl, type: String,   allow_nil: true

    def _to_json_struct
      super.merge({
                    "contentUrl" => contentUrl
                  })
    end
  end
end
