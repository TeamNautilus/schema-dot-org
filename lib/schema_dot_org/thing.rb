# frozen_string_literal: true

require 'schema_dot_org'

module SchemaDotOrg
  # Model the Schema.org `Thing`.  See https://schema.org/Thing
  class Thing < SchemaType
    attr_accessor :id, :url, :name, :image, :description, :main_entity_of_page

    validates :id, type: String, allow_nil: true
    validates :url, type: String, allow_nil: true
    validates :name, type: String, allow_nil: true
    validates :description, type: String, allow_nil: true
    validates :main_entity_of_page, type: Thing, allow_nil: true

    def _to_json_struct
      mapped_image = if image.is_a?(Array)
                       image.map { |i| (i.is_a? ImageObject) ? i.to_json_struct : i }
                     else
                       ((image.is_a? ImageObject) ? image.to_json_struct : image) if image.present?
                     end
      {
        '@id' => id,
        'url' => url,
        'name' => name,
        'image' => mapped_image,
        'description' => description,
        'mainEntityOfPage' => main_entity_of_page&.to_json_struct
      }
    end
  end
end
