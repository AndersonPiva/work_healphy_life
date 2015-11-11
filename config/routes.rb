Rails.application.routes.draw do
  resources :ratings
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
  resources :compromises
  resources :compromises
  resources :compromises
  resources :weighings
  resources :appointments
  resources :addresses
  resources :clinics
  devise_for :users, :controllers => {:registrations => "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


    namespace :admin do
      resources :patients
      resources :compromises
      resources :clinics
    end


  # You can have the root of your site routed with "root"
    scope "(:locale)", :locale => /pt|en/ do
    root :to => 'privates#afterlogin'

    get 'admin/patients' => 'admin/patients#index'
    get 'welcome' => 'privates#afterlogin'
    get 'dashboard' => 'privates#dashboard'
    get 'help' =>  'publics#help'
    get 'yourcontact' => 'contacts#new'
    get 'frequentlyaskedquestions' =>'publics#frequentlyaskedquestions'
    get 'about' => 'publics#about'
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
    get 'newrating' => 'ratings#new'
    get 'functions' => 'publics#functions'
    get 'aboutapp' => 'publics#aboutapp'
    get 'diets' => 'diets#index'
    get 'newdiet' => 'diets#new'
    match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
    devise_scope :user do
      get "login", to: "devise/sessions#new"
      get "resendconfirmationinstructions", to: "devise/confirmations#new"
    end
  end
end
