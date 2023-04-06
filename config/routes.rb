Rails.application.routes.draw do
  resources :movies do
    resources :scores, only: [:create, :destroy], param: :score_id
  end
end
