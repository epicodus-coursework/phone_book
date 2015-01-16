require('rspec')
require('contact')
require('phone')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#name") do
    it("returns the contact's name") do
      new_contact = Contact.new("Matt")
      expect(new_contact.name()).to(eq("Matt"))
    end
  end

  describe("#id") do
    it("returns the id of the contact") do
      new_contact = Contact.new("Matt")
      expect(new_contact.id()).to(eq(1))
    end
  end

  describe("#add_phone_number") do
    it("adds new phone numbers to a contact") do
      new_contact = Contact.new("Matt")
      new_phone_number = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      new_contact.add_phone_number(new_phone_number)
      expect(new_contact.phone_numbers()).to(eq([new_phone_number]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      new_contact = Contact.new("Matt")
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end

  describe(".clear") do
    it("empties out the saved contacts") do
      Contact.new("Matt").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a contact by it's id number") do
      new_contact = Contact.new("Matt")
      new_contact.save()
      new_contact2 = Contact.new("Chris")
      new_contact2.save()
      expect(Contact.find(new_contact.id())).to(eq(new_contact))
    end
  end
end
