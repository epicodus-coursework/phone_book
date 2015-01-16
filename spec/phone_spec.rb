require('rspec')
require('contact')
require('phone')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe("#home_phone") do
    it("returns the home phone number") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      expect(new_phone.home_phone()).to(eq("111-111-1111"))
    end
  end

  describe("#work_phone") do
    it("returns the work phone number") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      expect(new_phone.work_phone()).to(eq("222-222-2222"))
    end
  end

  describe("#cell_phone") do
    it("returns the cell phone number") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      expect(new_phone.cell_phone()).to(eq("333-333-3333"))
    end
  end

  describe("#id") do
    it("returns the id of the phone number") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      expect(new_phone.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new phone number to the array of saved phone numbers") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      new_phone.save()
      expect(Phone.all()).to(eq([new_phone]))
    end
  end

  describe(".clear") do
    it("empties out the saved phone numbers") do
      Phone.new("111-111-1111", "222-222-2222", "333-333-3333").save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a phone number by it's id number") do
      new_phone = Phone.new("111-111-1111", "222-222-2222", "333-333-3333")
      new_phone.save()
      new_phone2 = Phone.new("444-444-4444", "555-555-5555", "666-666-6666")
      new_phone2.save()
      expect(Phone.find(new_phone.id())).to(eq(new_phone))
    end
  end
end
