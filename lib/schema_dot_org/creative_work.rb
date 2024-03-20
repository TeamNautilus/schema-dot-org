# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > CreativeWork`.  See https://schema.org/CreativeWork
#
module SchemaDotOrg
  class CreativeWork < Thing
    attr_accessor :date_published, :author, :publisher, :offers, :headline, :alternative_headline, :thumbnail_url,
                  :about, :provider, :aggregate_rating, :main_entity

    validates :date_published, type: Date, allow_nil: true
    validates :author, type: Thing, allow_nil: true
    validates :publisher, type: Thing, allow_nil: true
    validates :offers, type: Array, allow_nil: true
    validates :main_entity, type: { with: [SchemaDotOrg::ItemList, Array] }, allow_nil: true
    validates :about, type: Thing, allow_nil: true
    validates :aggregate_rating, type: SchemaDotOrg::AggregateRating, allow_nil: true

    ValidatedObject::Base::TypeValidator

    def _to_json_struct
      mapped_main_entity = if main_entity.is_a?(Array)
                             main_entity.map(&:to_json_struct)
                           else
                             main_entity&.to_json_struct
                           end
      super.merge({
                    "headline" => headline,
                    "alternativeHeadline" => alternative_headline,
                    "offers" => offers&.map(&:to_json_struct),
                    "mainEntity" => mapped_main_entity,
                    "datePublished" => date_published&.iso8601,
                    "author" => author&.to_json_struct,
                    "publisher" => publisher&.to_json_struct,
                    "thumbnailUrl" => thumbnail_url,
                    "about" => about&.to_json_struct,
                    "provider" => provider&.to_json_struct,
                    "aggregateRating" => aggregate_rating&.to_json_struct
                  })
    end
  end
end
