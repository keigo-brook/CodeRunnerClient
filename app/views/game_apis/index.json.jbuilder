json.array!(@game_apis) do |game_api|
  json.extract! game_api, :id
  json.url game_api_url(game_api, format: :json)
end
