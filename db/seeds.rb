wishes = [
  {
    content: "世界が平和になりますように",
    user_name: "ユーザー1",
    likes_count: 10,
    fulfilled: false,
    remind_at: DateTime.now + 1.day
  },
  {
    content: "みんなが健康になりますように",
    user_name: "ユーザー2",
    likes_count: 5,
    fulfilled: false,
    remind_at: DateTime.now + 2.days
  },
  {
    content: "ペットが飼えますように",
    user_name: "ユーザー3",
    likes_count: 20,
    fulfilled: true,
    remind_at: DateTime.now + 3.days
  }
]

wishes.each do |wish|
  Wish.create!(wish)
end
