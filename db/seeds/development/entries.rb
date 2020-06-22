body =
  "サンプル\n\n" +
  "内容とサイトURL"

%w(Taro Jiro Hana).each do |name|
  member = Member.find_by(name: name)
  0.upto(9) do |idx|
    entry = Entry.create(
      author: member,
      title: "ナレッジ#{idx}",
      body: body,
      posted_at: 10.days.ago.advance(days: idx),
      status: %w(draft member_only public)[idx % 3])
    if idx == 7 || idx == 8
      %w(John Mike Sophy).each do |name2|
        voter = Member.find_by(name: name2)
        voter.voted_entries << entry
      end
    end
  end
end