Todo::Application.routes.draw do
  match('/', {:via => :get, :to => 'lists#index'})
  match('lists', {:via => :get, :to => 'lists#index'})
  match('lists', {:via => :post, :to => 'lists#create'})
  match('lists/new', {:via => :get, :to => 'lists#new'})
  match('lists/:id', {:via => :get, :to => 'lists#show'})


  match('tasks', {:via => :get, :to => 'tasks#index'})
  match('tasks', {:via => :post, :to => 'tasks#create'})
  match('tasks/new', {:via => :get, :to => 'tasks#new'})
  match('tasks/:id', {:via => :get, :to => 'tasks#show'})
  match('tasks/:id', {:via => :delete, :to => 'tasks#destroy'})
  match('tasks/:id/edit', {:via => :get, :to => 'tasks#edit'})
  match('tasks/:id', {:via => [:put, :patch], :to => 'tasks#update'})
  match('tasks/:id/done', {:via => [:put, :patch], :to => 'tasks#done'})
  match('tasks/:id/not_done', {:via => [:put, :patch], :to =>'tasks#not_done'})

end
