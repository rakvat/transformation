json.array!(@steps) do |step|
  json.extract! step, :code, :description, :start_state, :goal_state
  json.url step_url(step, format: :json)
end
