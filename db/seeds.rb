# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
urls = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo-hwuAQ5iPqE61-iquyLZXd3ZfBqMsl3U74p1q8iKHbajFu1c9j0xCpng',
  'https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjJq4yS0-3UAhXMKiYKHQCjCJEQjRwIBw&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeach%2F&psig=AFQjCNHA1yuMWxRBDHGUJXhahrS541F_4g&ust=1499189715505282',
  'https://static.pexels.com/photos/29724/pexels-photo-29724.jpg',
]

10.times do 
	urls.each do |url|
	  photo = Photo.create(url: url, title: Faker::Address.unique.city)
	  puts photo.title
	end
end
