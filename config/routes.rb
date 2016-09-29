Rails.application.routes.draw do
  resources :developers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'docs', to: redirect('/swagger-ui/dist/index.html?url=/docs/api-docs.json')
end
