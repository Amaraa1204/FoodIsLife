Rails.application.routes.draw do
  
  get 'admin/view'

  root 'admin#view'
end
