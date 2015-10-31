Rails.application.routes.draw do
  resources :addresses
  resources :foods
  resources :meals
  resources :diets
  resources :contacts
  resources :ratings
  resources :realizations
  resources :realizations
  resources :exercises
  resources :trainings
  resources :contacts
  resources :measurements
  resources :patients
  resources :patients
  resources :compromises
  resources :compromises
  resources :compromises
  resources :weighings
  resources :appointments
  resources :addresses
  resources :clinics
  resources :patients
  devise_for :users, :controllers => {:registrations => "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  scope "(:locale)", :locale => /pt|en/ do
  root :to => 'privates#dashboard'

  get 'dashboard' => 'privates#dashboard'
  get 'help' =>  'publics#help'
  get 'yourcontact' => 'contacts#new'
  get 'frequentlyaskedquestions' =>'publics#frequentlyaskedquestions'
  get 'about' => 'publics#about'
  get 'patients' =>'patients#index'
  get 'newpatient' =>'patients#new'
  get 'clinics' =>'clinics#index'
  get 'newclinic' => 'clinics#new'
  get 'appointments' => 'appointments#index'
  get 'newappointment' => 'appointments#new'
  get 'weighings' => 'weighings#index'
  get 'newweighing' => 'weighings#new'
  get 'compromises' => 'compromises#index'
  get 'newcompromise' => 'compromises#new'
  get 'newmeasurement' => 'measurements#new'
  get 'trainings' => 'trainings#index'
  get 'newtraining' => 'trainings#new'
  get 'realizations' => 'realizations#index'
  get 'ratings' => 'ratings#index'
  get 'functions' => 'publics#functions'
  get 'aboutapp' => 'publics#aboutapp'
  get 'diets' => 'diets#index'
  get 'newdiet' => 'diets#new' 
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "resendconfirmationinstructions", to: "devise/confirmations#new"
  end
end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
