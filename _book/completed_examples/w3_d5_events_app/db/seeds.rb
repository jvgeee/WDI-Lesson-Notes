# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all
Club.delete_all
Event.delete_all
User.delete_all

london = City.create!(name: "London", image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTkTi1nqT84bfqtIsmFXmhbCWcgt8EUW9Qi45dF2aezAtFMq4zu3w", description: "London, the capital of England.")

paris  = City.create!(name: "Paris", image: "http://i.telegraph.co.uk/multimedia/archive/02509/Paris-night_2509348b.jpg", description: "The city of love.")

fabric = london.clubs.create!(name: "Fabric", image: "http://www.ibiza-spotlight.com/sites/default/files/styles/promo_panel_image_740_400/public/article-images/124403/embedded-1415197738.jpg?itok=Dm4xvwJn", description: "Late night party.")

pacha = london.clubs.create!(name: "Pacha", image: "http://jukeboxpr.co.uk/wp-content/uploads/2013/10/PachaLondon.jpg", description: "From Ibiza to London.")

social = paris.clubs.create!(name: "Social Club", image: "http://s3.unlike.net/photos/0041/9542/Picture_3.jpg", description: "Cool interior.")

fabric.events.create!(name: "04.04.15", image: "http://www.fabriclondon.com/images/listings/events/thumbs/300-1056.jpg", description: "Craig Richards.")

alex = User.create!(name: "Alex", email: "alex@alex.com", image: "https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-xpf1/v/t1.0-9/10990026_10206088419829974_7840484061309057976_n.jpg?oh=07c15c52fd0b17fb66469d424296a623&oe=55B3BA93&__gda__=1438119148_10d121aa93e4fed3c5cc394a340b40bc")

gerry = User.create!(name: "Gerry", email: "gerry@gerry.com", image: "https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-xft1/v/t1.0-9/10488177_10203567992256891_2986034333454568851_n.jpg?oh=47d70f52b4763f49760f2727e4a25dc4&oe=55B96665&__gda__=1437685399_5897524abe74798cad369768f18fbc9d")

alex.likes.create!(likeable_id: pacha.id, likeable_type: pacha.class)
alex.likes.create!(likeable_id: fabric.id, likeable_type: fabric.class)

gerry.likes.create!(likeable_id: pacha.id, likeable_type: pacha.class)
gerry.likes.create!(likeable_id: fabric.id, likeable_type: fabric.class)
gerry.likes.create!(likeable_id: social.id, likeable_type: social.class)














