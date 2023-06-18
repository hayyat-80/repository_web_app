class RepositoriesController < ApplicationController
  def index
    redirect_to welcome_path
  end

  def show
    @repository =Repository.find(params[:id])
  end

  def new
    @repository =Repository.new
  end

  def create
    @repository = Repository.new(repository_params)
    if @repository.save
      redirect_to welcome_path
    else
      redirect_to new_repository_path, method: :get, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.where.not(id: current_user.id)
    @repository = Repository.find(params[:id])
  end

  def update
    @repository = Repository.find(params[:id])
    if @repository.update(repository_params)
      flash[:notice] = "Repository updated successfully."
      redirect_to welcome_path
    else
      render('edit')
    end
  end

  def destroy
    repository = Repository.find(params[:id]).destroy
    flash[:notice] = "Repository destroyed successfully."
    redirect_to welcome_path
    end

  private
  def repository_params
    params.require(:repository).permit(:name, :description, :owner, user_ids:[])
  end
end
