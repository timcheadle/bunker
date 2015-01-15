require 'csv'

module BottleImporter
  def self.import(filename)
    CSV.foreach(filename, headers: true) do |row|
      puts row

      Bottle.create!(
        name:        row['Name'],
        spirit:      row['Type'],
        volume:      row['Volume (ml)'].to_i,
        proof:       row['Proof'].to_d,
        released:    row['Released'],
        price:       row['Price'].to_d,
        acquired_on: Date.strptime(row['Acquired On'], '%Y-%m'),
        box:         row['Box #'],
        notes:       row['Notes'],
        source:      row['Acquired At'],
        score:       row['Score'],
        stocked:     row['Stock'] == 'x',
        open:        row['Open'] == 'x',
        finished:    row['Done'] == 'x',
      )
    end
  end
end
