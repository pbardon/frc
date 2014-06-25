User.create!(name: 'Garrosh', email: 'hellscream@azeroth.com')
User.create!(name: 'grom', email: 'hellscream332@azeroth.com')
User.create!(name: 'thrall', email: 'fdsajkasdfj@azeroth.com')
User.create!(name: 'jana', email: 'proudmoore@azeroth.com')
User.create!(name: 'arthas', email: 'minerias@azeroth.com')

Contact.create!(name: 'Garrosh', email: 'hellscream@azeroth.com', user_id: 1, favorite: true)
Contact.create!(name: 'grom', email: 'hellscream332@azeroth.com', user_id: 1, favorite: true)
Contact.create!(name: 'thrall', email: 'fdsajkasdfj@azeroth.com',user_id: 1)
Contact.create!(name: 'jana', email: 'proudmoore@azeroth.com', user_id: 1)
Contact.create!(name: 'arthas', email: 'minerias@azeroth.com', user_id: 1)


Comment.create!(user_id: 1, body: '1huiaejknfgsdnfgkjlsdfhgjklsdfgh', commentable_id: 1, commentable_type: "Contact")
Comment.create!(user_id: 1, body: '2huiaejknfgjlsdfhgjklsdfgh', commentable_id: 2, commentable_type: "Contact")
Comment.create!(user_id: 1, body: '3huiaejsdnfgkjlsdfhgjklsdfgh', commentable_id: 1, commentable_type: "Contact")
Comment.create!(user_id: 1, body: '4huiaejknfgsdnfhgjklsdfgh', commentable_id: 1, commentable_type: "User")
Comment.create!(user_id: 1, body: '5huiaejknfgsdnfgkjlsdfhgjklsdfgh', commentable_id: 1, commentable_type: "User")
Comment.create!(user_id: 1, body: '6huiaejknfgsdnfgkjlsdfhgjklsdfgh', commentable_id: 1, commentable_type: "Contact")