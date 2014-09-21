# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "anand", user_name: "aduddella", role: "admin", status: "active",
  email: "aduddella@gmail.com", password: "password", password_confirmation: "password")
User.create(name: "stefanie lim", user_name: "stef", role: "admin", status: "active",
  email: "stefanie.lim04@gmail.com", password: "password", password_confirmation: "password")
User.create(name: "kate montgomery", user_name: "kate", role: "admin", status: "active", email: "katharine.montgomery@gmail.com", password: "password", password_confirmation: "password")


Cheerup.create(content: "Feeling great about starting our cheerups app! :D", user_id: 2, created_at: "2014-09-20 17:56:01", updated_at: "2014-09-20 17:56:01")
Cheerup.create(content: "Setting up this cheerup model is sooo thrilling!", user_id: 2, created_at: "2014-09-20 18:02:10", updated_at: "2014-09-20 18:02:10")

