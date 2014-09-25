# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
# User.create(name: "anand", user_name: "aduddella", role: "admin", status: "active",
#   email: "aduddella@gmail.com", password: "password", password_confirmation: "password")
# User.create(name: "stefanie lim", user_name: "stef", role: "admin", status: "active",
#   email: "stefanie.lim04@gmail.com", password: "password", password_confirmation: "password")
# User.create(name: "kate montgomery", user_name: "kate", role: "admin", status: "active", email: "katharine.montgomery@gmail.com", password: "password", password_confirmation: "password")
# User.create(name: "Bonita Spinka", user_name: "Bonita", prominence: 3, password: "password", password_confirmation: "password")
# User.create(name: "Dexter Schoen", user_name: "Dexter", status: "active", role: "user" , email: "antonina_collins@macejkovic.org", prominence: 0, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password")
# User.create(name: "Mose Homenick V", user_name: "Mose", status: "active", role: "user", provider: nil, uid: nil, profile_picture: nil, prominence: 2, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password)
# User.create(name: "Ms. Guiseppe Marks", user_name: "Ms.", status: "active", role: "user", email: "trever.shields@kuphal.org", provider: nil, uid: nil, profile_picture: nil, prominence: 1, reputation: "Junior_Cheerupper”, password: "password", password_confirmation: "password”)
# User.create(name: "Ralph Berge", user_name: "Ralph", status: "active", role: "user", email: "eileen@conn.net", profile_picture: nil, prominence: 2, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password”)
# User.create( name: "Neil Mayer", user_name: "Neil", status: "active", role: "user", email: "courtney.luettgen@bergnaum.org", provider: nil, uid: nil, profile_picture: nil, prominence: 0, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password”)
# User.create(name: "Edythe Boyer", user_name: "Edythe", status: "active", role: "user", email: "carmelo.baumbach@pricestroman.biz", provider: nil, uid: nil, profile_picture: nil, prominence: 1, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password”)
# User.create(name: "Jeffrey Kautzer", user_name: "Jeffrey", status: "active", role: "user", email: "karley_heidenreich@smiththiel.net", provider: nil, uid: nil, profile_picture: nil, prominence: 2, reputation: "Junior_Cheerupper”,password: "password", password_confirmation: "password”)

# Cheerup.delete_all
# Cheerup.create(content: "Feeling great about starting our cheerups app! :D", user_id: User.first.id, created_at: "2014-09-20 17:56:01", updated_at: "2014-09-20 17:56:01")
# Cheerup.create(content: "Setting up this cheerup model is sooo thrilling!", user_id: User.first.id, created_at: "2014-09-20 18:02:10", updated_at: "2014-09-20 18:02:10")

def create_test_users

  10.times do  
    name = Faker::Name.name
    uname = name.split(' ')[0]
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,user_name: uname, email: email, password: password,  password_confirmation: password)
  end
end

def create_test_cheerups_data(user)
 3.times do  
  Cheerup.create!(content: Faker::Hacker.say_something_smart, user_id: user.id)
end
end


User.delete_all
User.create(name: "anand", user_name: "aduddella", role: "admin", status: "active",
 email: "anand@cheerup.com", password: "password", password_confirmation: "password")
User.create(name: "stefanie lim", user_name: "stef", role: "admin", status: "active",
 email: "stef@cheerup.com", password: "password", password_confirmation: "password")
User.create(name: "kate montgomery", user_name: "kate", role: "admin", status: "active", email: "kate@cheerup.com", password: "password", password_confirmation: "password")
create_test_users


Cheerup.delete_all
User.all.each do |user|
  create_test_cheerups_data(user)  
end

