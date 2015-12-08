# View Booking
post "/bookings/:id" do
	@booking = Booking.find(params[:id])
	erb :'bookings/show'
end
end

# To book
post "/properties/:id/book" do
	property = Property.find(params[:id])
	# property = property.booking.create_with(status: false).find_or_create_by(user_id: session[:user_id]).update(status: false)
	property_book = Booking.create(user_id: session[:user_id], property_id: params[:id], length: params[:length])
	erb :'properties/all'
	# question.vote_count.to_json
end

# To reset booking
post "/properties/:id/reset" do
	property = Property.find(params[:id])
	property.booking.destroy
	erb :'properties/all'
end