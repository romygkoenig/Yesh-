Performance.destroy_all
User.destroy_all

puts 'Cleaning database...'

puts 'Creating User...'
user = User.create(
  email: "bill@mail.com",
  password: "123456",
  first_name: "Bill",
  last_name: "Joe",
  remote_photo_url: "https://i.kinja-img.com/gawker-media/image/upload/s--vSY-o42Q--/c_scale,f_auto,fl_progressive,q_80,w_800/ecq5rsk3n1nolujedskk.jpg"
)

puts 'Creating Perfmances...'
Performance.create!({
  name: "Israeli Singer",
  description: "Fantastic singer for the past 20 years",
  price: "10",
  category: "Singing",
  city: "Tel Aviv",
  user: user,
  remote_photo_url: "https://media2.giphy.com/media/SLV9fy4ElySZy/200w.webp?cid=790b76115d133f8541544867593d293f&rid=200w.webp",
})
Performance.create!({
  name: "Magician",
  description: "An act that will blow your socks off",
  price: "30",
  category: "Other",
  city: "Paris",
  user: user,
  remote_photo_url: "https://media3.giphy.com/media/cdflDot60Ktb6lgs9R/200w.webp?cid=790b76115d1340726778714367d0e0e2&rid=200w.webp",
})
Performance.create!({
  name: "Belly Daner",
  description: "I can teach you all how to Belly dance!",
  price: "55",
  category: "Dancing",
  city: "New York",
  user: user,
  remote_photo_url: "https://media2.giphy.com/media/vSS5mG1u7EJ6E/giphy.webp?cid=790b76115d1340bc4578546e774f0ece&rid=giphy.webp",
})
Performance.create!({
  name: "Opera Singer",
  description: "You will love the show!",
  price: "15",
  category: "Singing",
  city: "Tel Aviv",
  user: user,
  remote_photo_url:"https://media1.giphy.com/media/o4hEwwrLBMXi8/200.webp?cid=790b76115d134107436f6a694d2bbb3e&rid=200.webp",
})


puts 'Finished!'

