Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'me' => 'users#index'
  post 'signup' => 'users#create'

  scope '/items' do
    post '/' => 'items#create'
    post '/:id/images' => 'items#update_images'
    get '/:id' => 'items#index'
  end

end
