desc "trade"
task :trade => :environment do

#Post.delete_all # REMOVE IN PRODUCTION, CLEARS DATABASE!

require 'nokogiri'
require 'open-uri'
require 'csv'

require 'simple.rb' # this runs the helper file that scrapes and saves, possibly not the best way!

#require "#{Rails.root}/app/lib/simple.rb"
#include Simple

end