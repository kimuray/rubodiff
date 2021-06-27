# frozen_string_literal: true

require_relative "rubodiff_support/version"
require "open-uri"
require "nokogiri"

module RubodiffSupport
  module_function

  def show_releases
    doc = Nokogiri::HTML(URI.open("https://github.com/rubocop/rubocop/releases/tag/v1.17.0"))
    doc.css(".markdown-body").first.css("h3").map { |node| node.next_sibling.next_sibling.css("li").size }
  end
end
