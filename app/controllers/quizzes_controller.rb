class QuizzesController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index; end

  protected

  def not_authenticated
    redirect_to root_path
  end
end