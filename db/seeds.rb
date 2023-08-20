# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#会員のダミーデータ
9.times do |n|
  Customer.create!(
    family_name: "令和#{n + 1}",
    first_name: "道子#{n + 1}",
    family_kana_name: "レイワ#{n + 1}",
    first_kana_name: "ミチコ#{n + 1}",
    post_number: "000000#{n + 1}",
    address: "北海道札幌市#{n + 1}",
    phone_number: "0000000000#{n + 1}",
    email: "test#{n + 1}@gmail.com",
    password: "test000#{0 + 1}",
  )
end

#管理者のログインデータ（完成後、これだけ残す）
  Admin.create!(
    email: "admin@gmail.com",
    password: "admin1234",
    )

#ジャンルのダミーデータ
5.times do |n|
  Genre.create!(
    name: "洋菓子#{n + 1}"
    )
end

#商品のダミーデータ
9.times do |n|
  Item.create!(
    genre_id: (n % 5) + 1,
    name: "世界で#{n + 1}番目に美味しいケーキ！",
    explanation: "世界で#{n + 1}番目に人気のケーキです。",
    price: 800,
    )
end