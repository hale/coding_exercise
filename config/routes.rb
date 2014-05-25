CodingExercise::Application.routes.draw do
  resources :contacts, only: [:new, :create, :show, :index] do
    get :autocomplete, on: :collection
  end
end
