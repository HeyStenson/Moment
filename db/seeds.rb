require 'ffaker'

Moment.destroy_all
Journal.destroy_all
User.destroy_all

5.times do 
	# populate the user params
	user_params = Hash.new
	user_params[:first_name] = FFaker::Name.first_name
	user_params[:last_name] = FFaker::Name.last_name
	user_params[:email] = FFaker::Internet.email
	user_params[:password]  = "password"
	user_params[:password_confirmation] = user_params[:password]
	# save the user
	new_user = User.create(user_params)

	# create 5 journals for each user
	5.times do
		new_journal = Journal.new
		new_journal.title = FFaker::Food.fruit
		new_journal.description = FFaker::Lorem.phrase
		# save the journal
		new_journal.save
		new_user.journals.push new_journal
	end	

	
end
