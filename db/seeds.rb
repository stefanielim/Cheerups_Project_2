
User.delete_all
# User.create(name: "anand", user_name: "aduddella", role: "admin", status: "active",
#  email: "anand@cheerup.com", password: "password", password_confirmation: "password")
# User.create(name: "stefanie lim", user_name: "stef", role: "admin", status: "active",
#  email: "stef@cheerup.com", password: "password", password_confirmation: "password")
# User.create(name: "kate montgomery", user_name: "kate", role: "admin", status: "active", email: "kate@cheerup.com", password: "password", password_confirmation: "password")
# create_test_users
User.create(name: "Stefanie Lim", user_name: "Stef", role: "admin", status: "active", email: "stef@cheerups.com", password: "cheerup$WDI8", password_confirmation: "cheerup$WDI8", prominence: 5, reputation: 'Junior_Cheerupper')
User.create(name: "Kate Montgomery", user_name: "Kate", role: "admin", status: "active", email: "kate@cheerups.com", password: "cheerup$WDI8", password_confirmation: "cheerup$WDI8", prominence: -5, reputation: 'Junior_Dragdowner')
User.create(name: "anand", user_name: "aduddella", role: "admin", status: "active", email: "aduddella@gmail.com", password: "cheerup$WDI8", password_confirmation: "cheerup$WDI8", prominence: 15, reputation: 'Senior_Cheerupper')

User.create(name: "Laurence James", user_name: "laulau", email: "laulau@gmail.com", password: "cheerup$WDI8", password_confirmation: "cheerup$WDI8")
User.create(name: "Colin Gillingham", user_name: "ihearttesla", email: "teslarocks@gmail.com", password: "cheerup$WDI8", password_confirmation: "cheerup$WDI8")

Cheerup.delete_all
# User.all.each do |user|
#   create_test_cheerups_data(user)  
# end