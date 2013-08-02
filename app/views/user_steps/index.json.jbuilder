json.array!(@user_steps) do |user_step|
  json.extract! user_step, :user_id, :step_id
  json.url user_step_url(user_step, format: :json)
end
