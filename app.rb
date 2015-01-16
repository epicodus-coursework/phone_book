require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/contact")

get("/") do
  @contacts = Contact.all()
  erb(:index)
end

post("/contacts") do
  name = params.fetch("name")
  phone_number = params.fetch("phone_number")
  contact = Contact.new(name, phone_number)
  contact.save()
  erb(redirect to("/"))
end
