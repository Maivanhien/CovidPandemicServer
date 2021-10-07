Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    root "covids#show"
    post "/covids", to: "covids#create"
  end
end
