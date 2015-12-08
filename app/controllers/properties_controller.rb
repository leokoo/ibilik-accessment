# Display new question form
get '/properties/new' do
	erb :"properties/new"
end

# View All Questions
get '/properties/all' do
	erb :"properties/all"
end

# Create new question
post '/properties' do
	property = Property.new(title: params[:title], price: params[:price], location: params[:location], user_id: session[:user_id])
	if property.save
	byebug
	redirect "/users/#{property.user_id}"
	else
		@warning = "Sorry, there's something wrong with your question"
		erb :"properties/new"
	end
end

# View question
get '/properties/:id' do
	@property = Property.find(params[:id])
	erb :'properties/show'
end

# Display question edit form
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :'properties/edit'
end 

# Update question
patch '/properties/:id' do
	property = Property.find(params[:id])
	property.update(title: params[:title], price: params[:price], location: params[:location])
	redirect "/properties/#{property.id}"
end

# Delete question
delete '/properties/:id' do
	property = Property.find(params[:id])
	property.destroy
	erb :"properties/all"
end
