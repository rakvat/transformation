json.array!(@moves) do |move|
  json.extract! move, :code, :description, :spread, :establ, :build, :happy, :time, :transformers
  json.url move_url(move, format: :json)
end
