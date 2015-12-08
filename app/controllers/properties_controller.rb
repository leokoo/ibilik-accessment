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
	question = Question.new(title: params[:title], user_id: session[:user_id])
	if question.save
	redirect "/users/#{question.user_id}"
	else
		@warning = "Sorry, there's something wrong with your question"
		erb :"questions/new"
	end
	# redirect "/users/#{question.user_id}"
end

# View question
get '/properties/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end

# Display question edit form
get '/properties/:id/edit' do
	@question = Question.find(params[:id])
	erb :'questions/edit'
end 

# Update question
patch '/properties/:id' do
	question = Question.find(params[:id])
	question.update(title: params[:title])
	redirect "/questions/#{question.id}"
end

# Delete question
delete '/properties/:id' do
	question = Question.find(params[:id])
	question.destroy
	erb :'static/index'
end
