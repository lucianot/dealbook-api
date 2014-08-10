class WelcomeController < ApplicationController
  def index
    render json: 'Welcome to Dealbook API', status: :ok
  end
end
