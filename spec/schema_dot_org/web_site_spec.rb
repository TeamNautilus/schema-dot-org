# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require 'schema_dot_org/web_site'
require 'schema_dot_org/search_action'

WebSite = SchemaDotOrg::WebSite
SearchAction = SchemaDotOrg::SearchAction

RSpec.describe WebSite do
  describe "#new" do
    it 'creates correct json without optional attributes' do
      basic_site = WebSite.new(
        name: 'Texas Public Law',
        url: 'https://texas.public.law'
      )

      expect(basic_site.to_json_struct).to eq(
                                             '@type' => 'WebSite',
                                             'name' => 'Texas Public Law',
                                             'url' => 'https://texas.public.law'
                                           )
    end

    it 'creates correct json with the optional attributes' do
      site_with_search = WebSite.new(
        name: 'Texas Public Law',
        url: 'https://texas.public.law',
        potential_action: SearchAction.new(
          target: SchemaDotOrg::EntryPoint.new(urlTemplate: 'https://texas.public.law/?search={search_term_string}').to_json_struct,
          query_input: SchemaDotOrg::PropertyValueSpecification.new(valueName: 'required name=search_term_string').to_json_struct
        )
      )

      expect(site_with_search.to_json_struct).to eq(
                                                   '@type' => 'WebSite',
                                                   'name' => 'Texas Public Law',
                                                   'url' => 'https://texas.public.law',
                                                   'potentialAction' => {
                                                     '@type' => 'SearchAction',
                                                     'target' => { '@type' => "EntryPoint",
                                                                   'urlTemplate' => 'https://texas.public.law/?search={search_term_string}' },
                                                     'query-input' => { "@type" => "PropertyValueSpecification",
                                                                        "valueName" => 'required name=search_term_string',
                                                                        "valueRequired" => "http://schema.org/True" }
                                                   }
                                                 )
    end
  end
end
# rubocop:enable Metrics/BlockLength
