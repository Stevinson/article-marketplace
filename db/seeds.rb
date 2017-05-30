# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Article.new(price: 10, title: "The Rise Of Auto-Complete Culture - And Why We Should Resist", summary: "Google wants to optimize self-expression and make us all sound the same.", url: "https://www.fastcodesign.com/90126569/the-rise-of-autocomplete-culture")

