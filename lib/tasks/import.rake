require "csv"
require 'scrobble_importer'

namespace :import do
  desc "Import a user's scrobbles from TSV (options: USERNAME=name PATH=path/to/scrobbles/tsv)"
  task from_tsv: :environment do

    username = ENV['USERNAME']
    tsv_filepath = ENV['PATH']

    user = User.find_or_create_by(username: username)
    headers, *scrobbles = CSV.read(tsv_filepath, { :col_sep => "\t" })

    importer = ScrobbleImporter.new
    importer.import(user, scrobbles)
  end
end
