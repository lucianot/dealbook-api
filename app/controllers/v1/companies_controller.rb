module V1
  class CompaniesController < ApplicationController
    def index
      companies = Company.all
      render json: companies, status: :ok
    end
  end
end
