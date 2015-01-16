require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#name") do
    it("returns the contact's name") do
      new_contact = Contact.new("Matt", "111-111-1111")
      expect(new_contact.name()).to(eq("Matt"))
    end
  end

  describe("#phone_number") do
    it("returns the contact's phone number") do
      new_contact = Contact.new("Matt", "111-111-1111")
      expect(new_contact.phone_number()).to(eq("111-111-1111"))
    end
  end

  describe("#id") do
    it("returns the id of the contact") do
      new_contact = Contact.new("Matt", "111-111-1111")
      expect(new_contact.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      new_contact = Contact.new("Matt", "111-111-1111")
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end

  describe(".clear") do
    it("empties out the saved contacts") do
      Contact.new("Matt", "111-111-1111").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a contact by it's id number") do
      new_contact = Contact.new("Matt", "111-111-1111")
      new_contact.save()
      new_contact2 = Contact.new("Chris", "222-222-2222")
      new_contact2.save()
      expect(Contact.find(new_contact.id())).to(eq(new_contact))
    end
  end
end
