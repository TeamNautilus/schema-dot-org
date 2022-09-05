# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require 'schema_dot_org/article'
require 'schema_dot_org/organization'
require 'schema_dot_org/person'

Article = SchemaDotOrg::Article
Organization = SchemaDotOrg::Organization
Person = SchemaDotOrg::Person

RSpec.describe Article do
  describe "#new" do
    it 'will not create with an unknown attribute' do
      expect do
        Article.new(
          snack_time: 'today',
          name: 'Public.Law',
          url: 'https://www.public.law'
        )
      end.to raise_error(NoMethodError)
    end

    it 'creates correct json correctly' do
      article = Article.new(
        article_section: 'Notebooks',
        headline: 'How to choose a notebook',
        date_published: Date.new(2021, 3, 30),
        image: 'https://image.url/image.png',
        url: 'https://article.url/article',
        author: Person.new(name: 'Acme'),
        publisher: Organization.new(name: 'Acme',
                                    logo: 'https://acme.url/logo.png')
      )

      expect(article.to_json_struct).to eq(
                                          "@type" => "Article",
                                          "articleSection" => 'Notebooks',
                                          "headline" => 'How to choose a notebook',
                                          "datePublished" => "2021-03-30",
                                          "image" => 'https://image.url/image.png',
                                          "url" => "https://article.url/article",
                                          "author" => {
                                            "@type" => "Person",
                                            "name" => "Acme"
                                          },
                                          "publisher" => {
                                            "@type" => "Organization",
                                            "name" => "Acme",
                                            "logo" => "https://acme.url/logo.png"
                                          }
                                        )
    end
  end
end
# rubocop:enable Metrics/BlockLength
