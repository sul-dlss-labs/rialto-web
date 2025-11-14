# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/webauth/login', to: 'authentication#login', as: 'login'
  get '/webauth/logout', to: 'authentication#logout', as: 'logout'
  get '/test_login/:id', to: 'authentication#test_login', as: 'test_login', param: :id if Rails.env.test?

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root 'home#show'

  get 'orcid-adoption', to: 'orcid_adoption#show', as: 'orcid_adoption_dashboard'

  Settings.tabs.orcid_adoption.to_h.each_key do |tab_name|
    method_name = tab_name.to_s.tr('-', '_')
    get "/orcid-adoption/#{tab_name}", to: "orcid_adoption##{method_name}", as: "orcid_adoption_#{method_name}"
  end

  # open access routes
  get 'open-access', to: 'open_access#show', as: 'open_access_dashboard'
  Settings.tabs.open_access.to_h.each_key do |tab_name|
    method_name = tab_name.to_s.tr('-', '_')
    get "/open-access/#{tab_name}", to: "open_access##{method_name}", as: "open_access_#{method_name}"
  end

  # publication routes
  get 'publications', to: 'publications#show', as: 'publications_dashboard'
  Settings.tabs.publications.to_h.each_key do |tab_name|
    method_name = tab_name.to_s.tr('-', '_')
    get "/publications/#{tab_name}", to: "publications##{method_name}", as: "publications_#{method_name}"
  end
end
