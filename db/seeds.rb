# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Game.create(name: 'trial', base_url: 'http://sample.coderunner.jp')
GameApi.create([{game_id: 1, end_point: '/q', name: '文章作成API'},
               {game_id: 1, end_point: '/profile', name: 'プロフィールAPI'}])
Parameter.create([{name: '判定させたい文章', param: 'str', game_api_id: 1},
                  {name: '一言', param: 'text', game_api_id: 2}])