# frozen_string_literal: true

require 'spec_helper'
require 'schema_dot_org/search_action'

RSpec.describe SchemaDotOrg::SearchAction do # rubocop:disable Metrics/BlockLength
  describe "#new" do
    it 'will not create a SearchAction without attributes' do
      expect { SchemaDotOrg::SearchAction.new }.to raise_error(ArgumentError)
    end

    it 'creates a SearchAction when given a target and query input' do
      expect do
        SchemaDotOrg::SearchAction.new(
          target: SchemaDotOrg::EntryPoint.new(urlTemplate: 'https://www.oregonlaws.org/?search={search_term_string}').to_json_struct,
          query_input: SchemaDotOrg::PropertyValueSpecification.new(valueName: 'required name=search_term_string').to_json_struct
        )
      end.to_not raise_error
    end
  end

  describe "#to_json_struct" do
    it "has exactly the correct attributes and values" do
      action = SchemaDotOrg::SearchAction.new(
        target: SchemaDotOrg::EntryPoint.new(urlTemplate: 'https://www.oregonlaws.org/?search={search_term_string}').to_json_struct,
        query_input: SchemaDotOrg::PropertyValueSpecification.new(valueName: 'required name=search_term_string').to_json_struct
      )
      expect(action.to_json_struct).to eq(
                                         '@type' => 'SearchAction',
                                         'target' => { '@type' => "EntryPoint",
                                                       'urlTemplate' => 'https://www.oregonlaws.org/?search={search_term_string}' },
                                         'query-input' => { "@type" => "PropertyValueSpecification",
                                                            "valueName" => 'required name=search_term_string',
                                                            "valueRequired"=>"http://schema.org/True"}
                                       )
    end
  end
end
