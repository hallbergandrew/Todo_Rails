class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def create
    @task = Task.create({:name => params[:name], :description => params[:description], :done => false})

    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end

  def edit
   @task = Task.find(params[:id])
   render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update({:name => params[:name] , :description => params[:description]})
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end

  def done
    done = Task.find(params[:id])
    done.update({:done => true})
    @list = List.find(done.list_id)
    @task_not_done = @list.tasks.where(done: false)
    @task_done = @list.tasks.where(done: true)
    render('lists/show.html.erb')
  end

  def not_done
    not_done = Task.find(params[:id])
    not_done.update({:done => false})
    @list = List.find(not_done.list_id)
    @task_not_done = @list.tasks.where(done: false)
    @task_done = @list.tasks.where(done: true)
    render('lists/show.html.erb')
  end

end
