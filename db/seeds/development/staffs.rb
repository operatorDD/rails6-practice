100.times do |i|
  Staff.create(
    email: "abc#{i}@gmail.com",
    password: '123456',
    family_name: "Apple#{i}",
    given_name: "Pen#{i}",
    family_name_kana: "apple#{i}",
    given_name_kana: "pen#{i}",
    start_date: Date.today - i
  )
end
