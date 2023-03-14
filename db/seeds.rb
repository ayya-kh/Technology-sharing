# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#テストデータ時にはコメントアウト
Tag.create!([
  { name: 'C言語' },
  { name: 'Java' },
  { name: 'HTML' },
  { name: 'CSS' },
  { name: 'Ruby' },
  { name: 'Ruby on Rails' },
])

Admin.create!(email:"admin@test",password:"testtest")

#テストデータ

# tags = Tag.create!([
#   { name: 'C言語' },
#   { name: 'Java' },
#   { name: 'HTML' },
#   { name: 'CSS' },
#   { name: 'Ruby' },
#   { name: 'Ruby on Rails' },
# ])

# users = User.create!(
#   [
#     {email: 'satou@test', name: 'Satou', password: 'satoru_pass'},
#     {email: 'suzuki@test', name: 'Suzuki', password: 'suzuki_pass'},
#     {email: 'takahashi@test', name: 'Takahashi', password: 'takahashi_pass'}
#   ]
# )

# Contribution.create!(
#   [
#     {title: '10秒カウントダウン動画', text: '10秒のカウントダウン動画です', video: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/【無料動画素材】10秒カウントダウン.mp4"), filename: '【無料動画素材】10秒カウントダウン.mp4'), tag_ids: [tags[0].id], user_id: users[0].id },
#     {title: '20秒サンプル動画', text: '20秒のサンプル動画です', video: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/20秒もない曲.mp4"), filename: '20秒もない曲.mp4'), tag_ids: [tags[1].id], user_id: users[1].id },
#     {title: '30秒BGM動画', text: '30秒のBGM動画です', video: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/30秒くらいの曲を作ってみた。.mp4"), filename: '30秒くらいの曲を作ってみた。.mp4'), tag_ids: [tags[2].id], user_id: users[2].id }
#   ]
# )