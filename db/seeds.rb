
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

