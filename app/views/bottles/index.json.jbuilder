json.array!(@bottles) do |bottle|
  json.extract! bottle, :id, :name, :type, :volume, :proof, :released, :price, :acquired_on, :open, :box, :notes, :score, :tradable, :sellable, :stocked, :open, :finished
  json.url bottle_url(bottle, format: :json)
end
