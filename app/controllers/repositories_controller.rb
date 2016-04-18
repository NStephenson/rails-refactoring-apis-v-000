class RepositoriesController < ApplicationController
  def index
    @user = GithubService.new(access_hash)
    @user.get_repos
    @repos = GithubRepo.all

  end

  def create
    service = GithubService.new(access_hash)
    service.create_repo(params[:name])
    redirect_to '/'
  end


  private

  def access_hash
    access_hash = {"access_token" => session[:token]}
  end
end
