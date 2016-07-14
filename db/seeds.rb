# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: "concannon.maggie@gmail.com", role: "admin", username: "administrator", avatar: "", password: 'password', password_confirmation: 'password')
u2 = User.create(email: "", role: "member", username: "Boston967", avatar: "", password: 'password', password_confirmation: 'password')
u3 = User.create(email: "", role: "member", username: "Blink1824eva", avatar: "", password: 'password', password_confirmation: 'password')
u4 = User.create(email: "", role: "member", username: "grouplove", avatar: "", password: 'password', password_confirmation: 'password')



v1 = Venue.create(name: "Orpheum Theater", capacity: "550", website: "http://crossroadspresents.com/orpheum-theatre", address: "1 Hamilton Pl, Boston, MA 02108", t_accessible: true, user_id: "")
v2 = Venue.create(name: "Brighton Music Hall", capacity: "250", website: "http://crossroadspresents.com/brighton-music-hall", address: "158 Brighton Ave, Allston, MA 02134", t_accessible: true, user_id: "")
v3 = Venue.create(name: "The Royale", capacity: "400", website: "http://royaleboston.com/", address: "279 Tremont St, Boston, MA 02116", t_accessible: true, user_id: "")
v4 = Venue.create(name: "The Sinclair", capacity: "300", website: "http://www.sinclaircambridge.com/", address: "52 Church St, Cambridge, MA 02138", t_accessible: true, user_id: "")
v5 = Venue.create(name: "The Paradise", capacity: "350", website: "http://crossroadspresents.com/paradise-rock-club", address: "967 Commonwealth Avenue, Boston, MA 02215", t_accessible: true, user_id: "")
v6 = Venue.create(name: "House of Blues", capacity: "500", website: "http://www.houseofblues.com/boston/", address: "15 Lansdowne St, Boston, MA 02215", t_accessible: true, user_id: "")
v7 = Venue.create(name: "Cafe 939", capacity: "100", website: "https://www.berklee.edu/red-room-cafe-939", address: " 939 Boylston St, Boston, MA 02115", t_accessible: true, user_id: "")
v8 = Venue.create(name: "Great Scott", capacity: "150", website: "http://www.greatscottboston.com/", address: "1222 Commonwealth Avenue, Allston, MA 02134", t_accessible: true, user_id: "")
