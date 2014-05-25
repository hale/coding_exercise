CodingExercise::Application.routes.draw do
  resources :contacts do
    get :autocomplete, on: :collection
    get :search, on: :collection
    get :query, on: :collection
  end

  root "contacts#search"
end
