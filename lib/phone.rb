class Phone
  @@all_phone_numbers = []

  define_method(:initialize) do |home_phone, work_phone, cell_phone|
    @home_phone = home_phone
    @work_phone = work_phone
    @cell_phone = cell_phone
    @id = @@all_phone_numbers.length().+(1)
  end

  define_method(:home_phone) do
    @home_phone
  end

  define_method(:work_phone) do
    @work_phone
  end

  define_method(:cell_phone) do
    @cell_phone
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@all_phone_numbers
  end

  define_method(:save) do
    @@all_phone_numbers.push(self)
  end

  define_singleton_method(:clear) do
    @@all_phone_numbers = []
  end

  define_singleton_method(:find) do |identification|
    found_phone_number = nil
    @@all_phone_numbers.each() do |phone_number|
      if phone_number.id().eql?(identification.to_i())
        found_phone_number = phone_number
      end
    end
    found_phone_number
  end
end
