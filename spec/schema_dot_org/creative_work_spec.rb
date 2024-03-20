# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require 'schema_dot_org/creative_work'
require 'schema_dot_org/thing'
require 'schema_dot_org/person'
require 'schema_dot_org/organization'
require 'schema_dot_org/offer'
require 'schema_dot_org/item_availability'
require 'schema_dot_org/item_list'
require 'schema_dot_org/list_item'
require 'schema_dot_org/aggregate_rating'

CreativeWork = SchemaDotOrg::CreativeWork
Thing = SchemaDotOrg::Thing
Person = SchemaDotOrg::Person
Organization = SchemaDotOrg::Organization
Offer = SchemaDotOrg::Offer
ItemAvailability = SchemaDotOrg::ItemAvailability
ItemList = SchemaDotOrg::ItemList
ListItem = SchemaDotOrg::ListItem
AggregateRating = SchemaDotOrg::AggregateRating

RSpec.describe CreativeWork do
  describe "#new" do
    it 'creates correct json without optional attributes' do
      basic_creative_work = CreativeWork.new(
        name: 'Texas Public Law',
        url: 'https://texas.public.law'
      )

      expect(basic_creative_work.to_json_struct).to eq(
                                                      '@type' => 'CreativeWork',
                                                      'name' => 'Texas Public Law',
                                                      'url' => 'https://texas.public.law'
                                                    )
    end

    it 'creates correct json with the optional attributes' do
      creative_work = CreativeWork.new(
        name: 'Texas Public Law',
        url: 'https://texas.public.law',
        headline: 'This is the headline',
        offers: [
          Offer.new(
            price: 0.00,
            price_currency: 'USD',
            availability: SchemaDotOrg::InStock.item,
            url: 'https://texas.public.law'
          )
        ],
        main_entity: ItemList.new(item_list_element: [
          ListItem.new(
            position: 1,
            url: 'https://texas.public.law')
        ]),
        date_published: Date.new(2021, 3, 30),
        author: Person.new(name: 'Acme'),
        publisher: Organization.new(name: 'Acme',
                                    logo: 'https://acme.url/logo.png'),
        thumbnail_url: 'https://texas.public.law/thumbnail.png',
        about: Thing.new(name: 'This is about the site'),
        provider: Organization.new(name: 'Acme',
                                   logo: 'https://acme.url/logo.png'),
        aggregate_rating: AggregateRating.new(rating_value: 4.5,
                                              best_rating: 5,
                                              review_count: 100)
      )

      expect(creative_work.to_json_struct).to eq(
                                                '@type' => 'CreativeWork',
                                                'name' => 'Texas Public Law',
                                                'url' => 'https://texas.public.law',
                                                "headline" => "This is the headline",
                                                "offers" => [
                                                  {
                                                    "@type" => "Offer",
                                                    "price" => 0.00,
                                                    "priceCurrency" => "USD",
                                                    "availability" => "https://schema.org/InStock",
                                                    "url" => "https://texas.public.law"
                                                  }
                                                ],
                                                "mainEntity" => {
                                                  "@type" => "ItemList",
                                                  "itemListElement" => [
                                                    {
                                                      "@type" => "ListItem",
                                                      "url" => "https://texas.public.law",
                                                      "position" => 1
                                                    }
                                                  ]
                                                },
                                                "datePublished" => "2021-03-30",
                                                "author" => {
                                                  "@type" => "Person",
                                                  "name" => "Acme"
                                                },
                                                "publisher" => {
                                                  "@type" => "Organization",
                                                  "name" => "Acme",
                                                  "logo" => "https://acme.url/logo.png"
                                                },
                                                "thumbnailUrl" => "https://texas.public.law/thumbnail.png",
                                                "about" => {
                                                  "@type" => "Thing",
                                                  "name" => "This is about the site"
                                                },
                                                "provider" => {
                                                  "@type" => "Organization",
                                                  "name" => "Acme",
                                                  "logo" => "https://acme.url/logo.png"
                                                },
                                                "aggregateRating" => {
                                                  "@type" => "AggregateRating",
                                                  "ratingValue" => 4.5,
                                                  "bestRating" => 5,
                                                  "reviewCount" => 100
                                                }
                                              )
    end
  end
end
# rubocop:enable Metrics/BlockLength
