# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Driver.create(first_name: "Teddy", last_name: "Ruby", phone: "4086948508", email: "ejr25@duke.edu", car_make: "Toyota", car_model: "Tacoma", car_color: "Silver", address: "1824 Constitution Ct")
Driver.create(first_name: "John", last_name: "Smith", phone: "4362484055", email: "j.smith@gmail.com", car_make: "Toyota", car_model: "Camry", car_color: "Blue", address: "2200 Anderson")
Driver.create(first_name: "Katie", last_name: "Jones", phone: "92986948508", email: "katie@duke.edu", car_make: "Honda", car_model: "Civic", car_color: "Black", address: "923 Oregon")
Driver.create(first_name: "Sarah", last_name: "Kim", phone: "4029348508", email: "Sarah.Kim@yahoo.com", car_make: "Nissan", car_model: "Altima", car_color: "Silver", address: "2938 Rigsbee")

Rider.create(first_name: "Katelyn", last_name: "Splint" , phone: "9293842930", tokens: "3", email: "ks@duke.edu", address: "394 Alexander")
Rider.create(first_name: "James", last_name: "Cage" , phone: "3292842339", tokens: "3", email: "cage@gmail.com", address: "1830 Pacific Ave")
Rider.create(first_name: "Mary", last_name: "Young" , phone: "52934542930", tokens: "3", email: "myoung@yahoo.com", address: "394 Broadway Ave")
Rider.create(first_name: "Jim", last_name: "Free" , phone: "9223842200", tokens: "3", email: "free_j@gmail.com", address: "293 Erwin")

Organization.create(name: "Durham Rescue Mission", street: "507 E Knox", city: "Durham", state: "NC", zip: "27705")
Organization.create(name: "Urban Ministries of Durham", street: "410 Liberty Street", city: "Durham", state: "NC", zip: "27705")