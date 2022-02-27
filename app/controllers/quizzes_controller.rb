class QuizzesController < ApplicationController
  before_action :require_login, only: %i[new create]
  # before_action :require_login, only: %i[new create]
  def index; end

  def new; end
  
  def create; end
end