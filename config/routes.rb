Rails.application.routes.draw do
  # Scan-to-pay demo flow: home -> scanner -> transactions/:id -> pin -> summary
  root to: "pages#home"
  get "home", to: "pages#home", as: :home
  get "scanner", to: "pages#scanner", as: :scanner
  get "transactions/:id", to: "pages#transaction", as: :transaction
  get "pin", to: "pages#pin", as: :pin
  post "summary", to: "pages#summary", as: :summary
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
