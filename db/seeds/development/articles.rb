body =
  "毎日コツコツと勉強。\n\n" +
  "最初は全く分からなかったが、少しずつ理解出来てきた。\n\n" +
  "継続することが大切なんだと痛感する。"

0.upto(9) do |idx|
  Article.create(
    title: "勉強の記録#{idx}",
    body: body,
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    member_only: (idx % 3 == 0)
  )
end

0.upto(29) do |idx|
  Article.create(
    title: "Article#{idx+10}",
    body: "blah, blah, blah...",
    released_at: 100.days.ago.advance(days: idx),
    expired_at: nil,
    member_only: false
  )
end