class Contact
  define_method(:initialize) do |name, phone|
    @name = name
    @phone = phone
  end

  define_method(:name) do
    @name
  end

  define_method(:phone) do
    @phone
  end
end
