Rails.application.routes.draw do
    get "/", to: "books#index"
    get "/show/:id", to: "books#show"
    post "/create", to: "books#create"
    put "/update/:id", to: "books#update"
    delete "/destroy/:id", to: "books#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
