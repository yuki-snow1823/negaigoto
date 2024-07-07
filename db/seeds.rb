# frozen_string_literal: true

wishes = [
  {
    content: "就職して障害を起こしませんように",
    user_name: "すずか",
    likes_count: 703,
    fulfilled: false,
  },
  {
    content: "安全にリリースできますように",
    user_name: "ほりゆう",
    likes_count: 3,
    fulfilled: false,
  },
  {
    content: "クリスマスプレゼントがもらえますように",
    user_name: "しげる。",
    likes_count: 4,
    fulfilled: false,
  },
  {
    content: "自分の差し入れを食べてもらえますように",
    user_name: "kochi",
    likes_count: 255,
    fulfilled: false,
  },
  {
    content: "プレステ5欲しい",
    user_name: "クレヘイ",
    likes_count: 100,
    fulfilled: false,
  },
  {
    content: "猫が飼いたい",
    user_name: "すずか",
    likes_count: 703,
    fulfilled: false,
  },

]

wishes.each do |wish|
  Wish.create!(wish)
end
