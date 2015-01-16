require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#name") do
    it("returns the contact's name") do
      new_contact = Contact.new("Matt", "123-456-7890")
      expect(new_contact.name()).to(eq("Matt"))
    end
  end

  describe("#phone_number") do
    it("returns the contact's phone number") do
      new_contact = Contact.new("Matt", "123-456-7890")
      expect(new_contact.phone_number()).to(eq("123-456-7890"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      new_contact = Contact.new("Matt", "123-456-7890")
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end

  describe(".clear") do
    it("empties out the saved contacts") do
      Contact.new("Matt", "123-456-7890").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end
end
