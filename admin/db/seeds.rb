# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Organization.create(name: "Durham Rescue Mission", street: "507 E Knox", city: "Durham", state: "NC", zip: "27705")
Organization.create(name: "Urban Ministries of Durham", street: "410 Liberty Street", city: "Durham", state: "NC", zip: "27705")


Driver.create(organization_id: "1", first_name: "Teddy", last_name: "Ruby", phone: "4086948508", email: "ejr25@duke.edu", car_make: "Toyota", car_model: "Tacoma", car_color: "Silver", address: "1824 Constitution Ct")
Driver.create(organization_id: "1", first_name: "John", last_name: "Smith", phone: "4362484055", email: "j.smith@gmail.com", car_make: "Toyota", car_model: "Camry", car_color: "Blue", address: "2200 Anderson")
Driver.create(organization_id: "1", first_name: "Katie", last_name: "Jones", phone: "92986948508", email: "katie@duke.edu", car_make: "Honda", car_model: "Civic", car_color: "Black", address: "923 Oregon")
Driver.create(organization_id: "2", first_name: "Sarah", last_name: "Kim", phone: "4029348508", email: "Sarah.Kim@yahoo.com", car_make: "Nissan", car_model: "Altima", car_color: "Silver", address: "2938 Rigsbee")

Rider.create(organization_id: "1", first_name: "Katelyn", last_name: "Splint" , phone: "9293842930", email: "ks@duke.edu", address: "394 Alexander")
Rider.create(organization_id: "1", first_name: "James", last_name: "Cage" , phone: "3292842339",  email: "cage@gmail.com", address: "1830 Pacific Ave")
Rider.create(organization_id: "1", first_name: "Mary", last_name: "Young" , phone: "52934542930",  email: "myoung@yahoo.com", address: "394 Broadway Ave")
Rider.create(organization_id: "2", first_name: "Jim", last_name: "Free" , phone: "9223842200",  email: "free_j@gmail.com", address: "293 Erwin")


Ride.create(organization_id: "1", rider_id: "1" , driver_id: "1" , pick_up_time: "2019-02-19 15:30:00" ,  start_street: "394 Alexander" , start_city: "Durham" , start_state: "NC", start_zip: "27708", end_street: "840 Hillsborough" , end_city: "Durham", end_state: "NC", end_zip: "27705", reason: "Interview", status: "matched")
Ride.create(organization_id: "1", rider_id: "2" , driver_id: "2" , pick_up_time: "2019-02-22 08:30:00" ,  start_street: "1830 Pacific Ave" , start_city: "Durham" , start_state: "NC", start_zip: "27708", end_street: "2200 Erwin" , end_city: "Durham", end_state: "NC", end_zip: "27705", reason: "Doctor's appointment", status: "requested")
Ride.create(organization_id: "1", rider_id: "3" , driver_id: "3" , pick_up_time: "2019-02-23 12:15:00" ,  start_street: "394 Broadway Ave" , start_city: "Durham" , start_state: "NC", start_zip: "27708", end_street: "203 Club Ave." , end_city: "Durham", end_state: "NC", end_zip: "27705", reason: "Haircut", status: "requested")
Ride.create(organization_id: "2", rider_id: "4" , driver_id: "4" , pick_up_time: "2019-03-11 14:30:00" ,  start_street: "293 Erwin" , start_city: "Durham" , start_state: "NC", start_zip: "27708", end_street: "2938 Main Street" , end_city: "Durham", end_state: "NC", end_zip: "27705", reason: "Teacher Conference", status: "completed")


Token.create(rider_id: "1", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "1", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "1", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "2", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "2", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "2", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "3", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "3", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "4", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)
Token.create(rider_id: "4", created_at: "2019-02-19 12:30" , expires_at: "2019-05-19 12:30",  used_at: nil, is_valid: true)

ScheduleWindow.create(driver_id: "1", start_date: "2019-1-1", end_date: "2020-1-1", start_time: "2019-01-01 10:30:00", end_time: "2019-01-01 14:30:00", is_recurring: true)
ScheduleWindow.create(driver_id: "1", start_date: "2019-1-3", end_date: "2020-1-3", start_time: "2019-01-03 10:30:00", end_time: "2019-01-01 14:30:00", is_recurring: true)
ScheduleWindow.create(driver_id: "2", start_date: "2019-1-4", end_date: "2019-1-4", start_time: "2019-01-04 12:30:00", end_time: "2019-01-04 17:30:00", is_recurring: false)
ScheduleWindow.create(driver_id: "2", start_date: "2019-1-5", end_date: "2020-1-5", start_time: "2019-01-01 10:30:00", end_time: "2019-01-01 12:30:00", is_recurring: true)

RecurringPattern.create(schedule_window_id: "1", day_of_week: "3")
RecurringPattern.create(schedule_window_id: "2", day_of_week: "5")
RecurringPattern.create(schedule_window_id: "4", day_of_week: "7")
