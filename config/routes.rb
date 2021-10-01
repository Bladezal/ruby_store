Rails.application.routes.draw do
    root "home#index"
    
    resources :books, :categories, :companies, :games, :platforms

end
