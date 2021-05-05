

if @booking_count > 1

    json.array! @bookings do |booking|
      json.extract! booking, :id, :start_date_time, :end_date_time, :start_last_booking, :end_last_booking, :booking_shop_comment, :created_at, :updated_at
      json.last_name booking.customer.last_name
      json.pet_name booking.pet.pet_name
      json.pet_gender booking.pet.gender
      json.menus do 
        json.menu_name booking.menu.pluck(:menu_name)
        json.menu_price booking.menu.pluck(:price)
      end
    end

end



if @booking_count == 1
  json.bookings do
    json.extract! bookings, :id, :start_date_time, :end_date_time, :start_last_booking, :end_last_booking, :booking_shop_comment, :created_at, :updated_at
    json.last_name bookings.customer.last_name
    json.mobilephone bookings.customer.mobilephone
    json.mobilephone_eq bookings.customer.mobilephone
    json.last_name_eq bookings.customer.last_name
    json.mobilephone bookings.customer.last_name
    json.pet_name bookings.pet.pet_name
    json.pet_gender bookings.pet.gender
    json.menus do 
      json.menu_name bookings.menu.pluck(:menu_name)
      json.menu_price bookings.menu.pluck(:price)
    end
  end

  if @booking_count.nil?

    json.array! @bookings do |booking|
      json.extract! booking, :id, :start_date_time, :end_date_time, :start_last_booking, :end_last_booking, :booking_shop_comment, :created_at, :updated_at
      json.last_name booking.customer.last_name
      json.pet_name booking.pet.pet_name
      json.pet_gender booking.pet.gender
      json.menus do 
        json.menu_name booking.menu.pluck(:menu_name)
        json.menu_price booking.menu.pluck(:price)
      end
    end

end
end
 