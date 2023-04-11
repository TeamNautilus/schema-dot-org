# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > CreativeWork`.  See https://schema.org/CreativeWork
#
module SchemaDotOrg
  class CreativeWork < Thing
    attr_accessor :date_published, :author, :publisher, :offers, :headline, :alternative_headline, :thumbnail_url,
                  :about, :provider, :aggregate_rating

    validates :date_published,         type: Date, allow_nil: true
    validates :author,                 type: Thing, allow_nil: true
    validates :publisher,              type: Thing, allow_nil: true
    validates :offers,                 type: Array, allow_nil: true
    validates :about,                  type: Thing, allow_nil: true
    validates :aggregate_rating,       type: SchemaDotOrg::AggregateRating, allow_nil: true

    def _to_json_struct
      super.merge({
                      "headline" => headline,
                      "alternativeHeadline" => alternative_headline,
                      "offers" => offers&.map(&:to_json_struct),
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
