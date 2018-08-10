Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [ :create, :update]
  end
  resources :doses, only: [ :update, :destroy]
  get "cocktails/:id/doses/:dose_id", to: "doses#edit", as: :new_or_edit_dose
  # get "cocktails/:id/doses/:dose_id", to: "doses#edit", as: :edit_dose
  # post "cocktails/:id/doses", to: "doses#create"
end

# A user can see the list of cocktails
# A user can see the details of a given cocktail, with the dose needed for each ingredient
# A user can create a new cocktail
