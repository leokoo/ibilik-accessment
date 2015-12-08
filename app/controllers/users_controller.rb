# Creating the new user
post '/signup' do 
	user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	# user = User.new(params[:user])
	#params[:user] => 
	if user.save
		session[:user_id] = user.id
		redirect "users/#{user.id}"
	else
		@warning = "Sorry, there's something wrong with your details"
		erb :"users/login"
	end
end

# Read
# Reading the user login
post '/users/login' do
	user = User.authenticate(params[:email], params[:password])
	if user
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@warning = "Login failed, please try again"
		erb :"users/login"
	end
end

# User logout
get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Read the route for user signup
get '/users/signup' do
	erb :"users/signup"
end

# Read the route for user login
get '/users/login' do
	erb :"users/login"
end

# Read User Profile
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/profile'
end