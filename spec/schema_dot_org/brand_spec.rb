# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require 'schema_dot_org/brand'

Brand = SchemaDotOrg::Brand


RSpec.describe Brand do
  describe "#new" do
    it 'will not create with an unknown attribute' do
      expect do
        Brand.new(
          snack_time:       'today',
          name:             'Public.Law',
          url:              'https://www.public.law'
        )
      end.to raise_error(NoMethodError)
    end

    it 'creates correct json correctly' do
      public_law = Brand.new(
        name:             'Public.Law',
        url:              'https://www.public.law'
      )

      expect(public_law.to_json_struct).to eq(
        "@type" => "Brand",
        'name' => "Public.Law",
        'url' => "https://www.public.law"
      )
    end
  end
end
# rubocop:enable Metrics/BlockLength
