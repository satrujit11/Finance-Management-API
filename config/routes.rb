# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :lendings do
        member do
          put :complete
        end
      end
      resources :expenses do
        collection do
          get :index_all
        end
      end
      resources :incomes do
        collection do
          get :index_all
        end
      end
    end
  end
end
