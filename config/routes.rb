CodingExercise::Application.routes.draw do
  resources :contacts, only: [:new, :create, :show, :index, :edit, :update] do
    get :autocomplete, on: :collection
  end
end
