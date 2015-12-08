# Create new comment
post '/comments' do
	comment = Comment.create(reply: params[:reply], user_id: session[:user_id], property_id: params[:property_id])
		redirect "/properties/#{comment.property.id}"
end

# View comment
get '/comments/:id' do
	@comment = Comment.find(params[:id])
	erb :'comments/show'
end

# Display comment edit form
get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'comments/edit'
end 

# Update comment
patch '/comments/:id' do
	comment = Comment.find(params[:id])
	comment.update(reply: params[:reply])
	redirect "/comments/#{comment.id}"
end

# Delete comment
delete '/comments/:id' do
	comment = Comment.find(params[:id])
	comment.destroy
	erb :'static/index'
end
