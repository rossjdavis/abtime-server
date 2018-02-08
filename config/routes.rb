Rails.application.routes.draw do
  scope '/auth' do
    post 'user_token', to: 'authentication#authenticate'
  end

  scope '/employee' do
    post 'clock_in', to: 'employee#clock_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
