json.array!(@planets) do |planet|
  json.extract! planet, :id, :user_id, :left, :right, :sonar_system, :planet_type
end
