Rails.application.routes.draw do 

  scope '/auth' do
    post 'login_request' => 'user_token#authenticate_user'
    post 'admin_request' => 'admin_auth#check_permissions'
  end

  scope '/employee' do
    post 'clock_in' => 'employee#clock_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
