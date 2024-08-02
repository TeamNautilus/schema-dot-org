# frozen_string_literal: true

require 'schema_dot_org'

# Model the Schema.org `MediaObject > ImageObject`.  See https://schema.org/ImageObject
#
module SchemaDotOrg
  class ImageObject < MediaObject
    attr_accessor :caption, :width, :height

    def _to_json_struct
      super.merge({
                    "caption" => caption,
                    "width" => width,
                    "height" => height
                  })
    end
  end
end
