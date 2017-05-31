# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Article.create!(price: 10, title: "The Rise Of Auto-Complete Culture - And Why We Should Resist", summary: "Google wants to optimize self-expression and make us all sound the same.", url: "https://www.fastcodesign.com/90126569/the-rise-of-autocomplete-culture", user: User.first)
Article.create!(price: 10, title: "Why Do So Few People Major In Computer Science?", summary: "In 2005, about 54,000 people in the US earned bachelor’s degrees in computer science. That figure was lower every year afterwards until 2014, when 55,000 people majored in CS. Why has that number remained so low, despite high wages and prominence of Silicon Valley?", url: "http://gizmodo.com/how-do-animals-experience-hunger-1795337295", user: User.first)
Article.create!(price: 10, title: "Learn Everything You Need To Know About Cybersecurity (And Then Get Certified In It)?", summary: "Study for the CISA, CISM, & CISSP Exams and maybe even jumpstart a new career.", url: "https://store.digg.com/sales/cyber-security-certification-mega-bundle?utm_source=digg.com&utm_medium=referral&utm_campaign=cyber-security-certification-mega-bundle_052917&utm_term=scsf-232887", user: User.first)

