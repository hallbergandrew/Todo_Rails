class ListsController < ApplicationController
  def index
    @lists = List.all
    render('lists/index.html.erb')
  end

  def new
    @list = List.new
    render('lists/new.html.erb')
  end

  def create
    @list = List.new({:name => params[:name]})

    if @list.save
      render('lists/success.html.erb')
    else
      render('lists/new.html.erb')
    end
  end

  def show
    @list = List.find(params[:id])
    @task_done = @list.tasks.where(:done => true)
    @task_not_done = @list.tasks.where(:done => false)
    render('lists/show.html.erb')
  end
end
