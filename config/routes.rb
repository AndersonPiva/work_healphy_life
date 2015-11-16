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


    namespace :admin do
      resources :compromises
      resources :clinics
      resources :weighings
      resources :appointments
      resources :measurements
      resources :diets
      resources :trainings
      resources :realizations
      resources :ratings
      get '/dashboard' => 'admin#dashboard'
      get '/patients' => 'admin#patients'
    end

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
  end
end
