CodingExercise::Application.routes.draw do
  resources :contacts, only: [:new, :create, :show, :index, :edit, :update] do
    get :autocomplete, on: :collection
    get :search, on: :collection
    get :query, on: :collection
  end

  root "contacts#search"
end
