json.array!(@states) do |state|
  json.extract! state, :spread, :establ, :build, :happy, :time, :transformers
  json.url state_url(state, format: :json)
end
