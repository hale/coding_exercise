CodingExercise::Application.routes.draw do
  resources :contacts, only: [:new, :create]
end
