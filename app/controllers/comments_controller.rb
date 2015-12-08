# Create new answer
post '/comments' do
	comment = Comment.create(reply: params[:reply], user_id: session[:user_id], property_id: params[:property_id])
		redirect "/properties/#{comment.property.id}"
		# erb :"answers/new"
end

# View All Answers
get '/answers/all' do
	erb :"answers/all"
end

# View answer
get '/answers/:id' do
	@answer = Answer.find(params[:id])
	erb :'answers/show'
end

# Display answer edit form
get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :'answers/edit'
end 

# # Update question
# patch '/questions/:id' do
# 	question = Question.find(params[:id])
# 	question.update(title: params[:title], user_id: session[:user_id])
# 	redirect "/questions/#{question.id}"
# end

# # Delete question
# delete '/questions/:id' do
# 	question = Question.find(params[:id])
# 	question.destroy
# 	erb :'static/index'
# end
