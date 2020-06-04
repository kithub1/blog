body =
  "内容ト\n\n" +
  "内容" +
  "内容"

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
    body: "perginate",
    released_at: 100.days.ago.advance(days: idx),
    expired_at: nil,
    member_only: false
  )
end