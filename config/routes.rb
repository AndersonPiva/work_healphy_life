Rails.application.routes.draw do
  devise_for :patients, :controllers => {:registrations => "registrations"}
  resources :ratings
  resources :addresses
  resources :meals
  resources :diets
  resources :contacts
  resources :ratings
  resources :realizations
  resources :exercises
  resources :trainings
  resources :contacts
  resources :measurements
  resources :weighings
  resources :appointments
  resources :addresses
  devise_for :users, :controllers => {:registrations => "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

    namespace :admin do
      resources :compromises
      resources :clinics
      resources :weighings
      resources :appointments
      resources :measurements
      resources :diets
      resources :trainings
      get '/dashboard' => 'admin#dashboard'
      get '/patients' => 'admin#patients'
    end


  # You can have the root of your site routed with "root"
    scope "(:locale)", :locale => /pt|en/ do
    root :to => 'privates#afterlogin'

    get 'functions' => 'publics#functions'
    get 'welcome' => 'privates#afterlogin'
    get 'dashboard' => 'privates#dashboard'
    get 'help' =>  'publics#help'
    get 'yourcontact' => 'contacts#new'
    get 'frequentlyaskedquestions' =>'publics#frequentlyaskedquestions'
    get 'about' => 'publics#about'
    match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
    devise_scope :user do
      get "login", to: "devise/sessions#new"
      get "resendconfirmationinstructions", to: "devise/confirmations#new"
    end
  end
end
