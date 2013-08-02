json.array!(@user_states) do |user_state|
  json.extract! user_state, :user_id, :state_id
  json.url user_state_url(user_state, format: :json)
end
