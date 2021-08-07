#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.ministre').xpath('text()').map(&:text).join(' ').tidy
    end

    def position
      noko.css('.ministeri').xpath('text()').map(&:text).join(' ').tidy
    end
  end

  class Members
    def member_container
      noko.css('#system table')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
