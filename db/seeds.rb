# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: "concannon.maggie@gmail.com", role: "admin", username: "administrator", avatar: nil, password: 'password', password_confirmation: 'password')
u2 = User.create(email: "mconboston2@gmail.com", role: "member", username: "Boston967", avatar: nil, password: 'password', password_confirmation: 'password')
u3 = User.create(email: "mconboston3@gmail.com", role: "member", username: "Blink1824eva", avatar: nil, password: 'password', password_confirmation: 'password')
u4 = User.create(email: "mconboston4@gmail.com", role: "member", username: "grouplove", avatar: nil, password: 'password', password_confirmation: 'password')



v1 = Venue.create(name: "Orpheum Theater", capacity: "550", website: "http://crossroadspresents.com/orpheum-theatre", address: "1 Hamilton Pl, Boston, MA 02108", t_accessible: true, user_id: u2.id)
v2 = Venue.create(name: "Brighton Music Hall", capacity: "250", website: "http://crossroadspresents.com/brighton-music-hall", address: "158 Brighton Ave, Allston, MA 02134", t_accessible: true, user_id: u2.id)
v3 = Venue.create(name: "The Royale", capacity: "400", website: "http://royaleboston.com/", address: "279 Tremont St, Boston, MA 02116", t_accessible: true, user_id: u3.id)
v4 = Venue.create(name: "The Sinclair", capacity: "300", website: "http://www.sinclaircambridge.com/", address: "52 Church St, Cambridge, MA 02138", t_accessible: true, user_id: u3.id)
v5 = Venue.create(name: "The Paradise", capacity: "350", website: "http://crossroadspresents.com/paradise-rock-club", address: "967 Commonwealth Avenue, Boston, MA 02215", t_accessible: true, user_id: u4.id)
v6 = Venue.create(name: "House of Blues", capacity: "500", website: "http://www.houseofblues.com/boston/", address: "15 Lansdowne St, Boston, MA 02215", t_accessible: true, user_id: u4.id)
v7 = Venue.create(name: "Cafe 939", capacity: "100", website: "https://www.berklee.edu/red-room-cafe-939", address: " 939 Boylston St, Boston, MA 02115", t_accessible: true, user_id: u4.id)
v8 = Venue.create(name: "Great Scott", capacity: "150", website: "http://www.greatscottboston.com/", address: "1222 Commonwealth Avenue, Allston, MA 02134", t_accessible: true, user_id: u4.id)

# Review Example
# r = Review.create(user_id: , venue_id: , rating: , body: "")

# Venue 1

r1 = Review.create(user_id: u2.id, venue_id: v1.id, rating: 3, body: "Pros: vintage feel, great location, good capacity. Lots of great bars and restaurants near by, adjacent to Park MBTA stop. Cons: hard to navigate, crowded tight spaces, old narrow seats, low balcony. Bottom line if you are going here you are probably more concerned about the band itself, but be prepared for an 'old-school' experience.")

# Venue 2

r2 = Review.create(user_id: u3.id, venue_id: v2.id, rating: 5, body: "Run river north played. Amazing. Everything was on schedule and the set up between the opener and run river north was short. Everything was smooth letting us focus on the music. And also the bartender was great. Shots are big!")
r3 = Review.create(user_id: u4.id, venue_id: v2.id, rating: 4, body: "A small-ish venue where the stage is high enough and the floor wide enough so that everyone can see and hear the band? These are the unicorns of the concert hall world. Somehow, BMH fits the bill. ")
r4 = Review.create(user_id: u2.id, venue_id: v2.id, rating: 5, body: "Went here a lot over the years when it was named Harper's Ferry and have seen some great bands Vast, Antigones Rising, etc. I just went to see Aurora. The sound system is top notch, the beer fairly priced and the staff... just ridiculously friendly. Will be returning.")

# Venue 3

r5 = Review.create(user_id: u2.id, venue_id: v3.id, rating: 5, body: "The Royal is an amazing Vaudeville Art Deco venue in downtown Boston. I went to see Allen Stone here the other night which was awesome, and making the event even better was the quality of the venue and its staff.")

# Venue 4

r6 = Review.create(user_id: u2.id, venue_id: v4.id, rating: 4, body: "Came here for the Naked and Famous show and it was great! The venue's got a separate bar room from the concert room so not everyone is trying to listen to music and crowd the bartender all at the same time. For a few bucks there's also coat check (protip: get your coat during encore or prepare to wait!).")

# Venue 5

r7 = Review.create(user_id: u2.id, venue_id: v5.id, rating: 4, body: "Paradise Rock Club might actually be one of my favorite small concert venues in the Boston area. The acoustics are fantastic, there are several bars spread out across the venue for maximum drink intake(decent prices too!), and the second floor is by far the best part.")
r8 = Review.create(user_id: u3.id, venue_id: v5.id, rating: 1, body: "I went to see Stephen Marley at the paradise...I love Ragga and have seen him many times all over New England and the world... this venue I've been to 3 times and all three times I had to TRY to have a good time. The artists are always on point but the hospitality of this venue is POOR -- each time there was a problem with rude bartenders and staff!!!")

# Venue 6

r9 = Review.create(user_id: u3.id, venue_id: v6.id, rating: 1, body: "Venue staff are friendly I guess but not well trained/knowledgeable. They usually offer front of the line access to the concert to those that dine in their restaurant. I called in advance to confirm and was told that's the case but then it wasn't when I showed up. THANKS GUYS.")
r10 = Review.create(user_id: u4.id, venue_id: v6.id, rating: 2, body: "I've probably been to the House of Blues a dozen times throughout the years. I do not love the venue, but they continue to book shows that I want to see, and thus... I go")

# Venue 7

r11 = Review.create(user_id: u2.id, venue_id: v7.id, rating: 5, body: "I came here for a Berklee performance, and it was lovely! I didn't have any of the food, but it seemed like a place for students and regular Bostonians alike. The venue was small and intimate--really nice! This was a cabaret of broadway tunes. The students were really talented and the show was free!  A wonderful Boston gem.")
r12 = Review.create(user_id: u4.id, venue_id: v7.id, rating: 4, body: "Great place to see some talented musicians. We went to see Charlie peacock and it was a pleasant experience!
The cafe had great coffee and the room was rocking!")

# Venue 8

r13 = Review.create(user_id: u3.id, venue_id: v8.id, rating: 4, body: "I love this venue! If you're looking for an intimate show, I recommend checking out Great Scott! It's so small that we were able to chat with the artists. I also like how you can just sit and watch the show too. Tickets are also quite affordable here.")
r14 = Review.create(user_id: u2.id, venue_id: v8.id, rating: 5, body: "This is a great tiny venue. You can either get right up front and be as close to the stage as possible, or if you prefer you can sit at some high tables towards the back and still see perfectly. Most shows are in the $10-$12 range.")
