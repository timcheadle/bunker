namespace :bottles do
  task import: :environment do
    BottleImporter.import(ENV['file'])
  end
end
