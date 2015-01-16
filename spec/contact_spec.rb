require('rspec')
require('contact')

describe(Contact) do
  describe("#name") do
    it("returns the contact's name") do
      new_contact = Contact.new("Matt", "123-456-7890")
      expect(new_contact.name()).to(eq("Matt"))
    end
  end

  describe("#phone") do
    it("returns the contact's phone number") do
      new_contact = Contact.new("Matt", "123-456-7890")
      expect(new_contact.phone()).to(eq("123-456-7890"))
    end
  end
end
