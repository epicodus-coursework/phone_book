require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/contact")
require("./lib/phone")

get("/") do
  @contacts = Contact.all()
  erb(:index)
end

post("/contacts") do
  name = params.fetch("name")
  Contact.new(name).save()
  @contacts = Contact.all()
  erb(:index)
end

post("/phone_numbers") do
  home_phone = params.fetch("home_phone")
  work_phone = params.fetch("work_phone")
  cell_phone = params.fetch("cell_phone")
  @phone_number = Phone.new(home_phone, work_phone, cell_phone)
  @phone_number.save()
  @contact = Contact.find(params.fetch("contact_id").to_i())
  @contact.add_phone_number(@phone_number)
  erb(:contact)
end

get("/phone_numbers/:id") do
  @phone_number = Phone.find(params.fetch("id").to_i())
  erb(:phone_number)
end

get("/contacts/:id") do
  @contact = Contact.find(params.fetch("id").to_i())
  erb(:contact)
end
