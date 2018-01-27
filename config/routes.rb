Rails.application.routes.draw do

	resources :issues do
		member do
			get 'like'
			get 'unlike'
		end
	end

 	resources :users

  	# Authentication
  	scope '/auth' do
  		post '/sign_up' => 'users#create'
  		post '/sign_in' => 'authentication#sign_in'
  	end

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
