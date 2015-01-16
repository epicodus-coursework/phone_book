class Contact
  @@all_contacts = []

  define_method(:initialize) do |name, phone_number|
    @name = name
    @phone_number = phone_number
    @id = @@all_contacts.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:phone_number) do
    @phone_number
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:find) do |identification|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id().eql?(identification)
        found_contact = contact
      end
    end
    found_contact
  end
end
