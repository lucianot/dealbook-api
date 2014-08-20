module V1
  class CompaniesController < ApplicationController
    def index
      companies = Company.all
      render json: companies, status: :ok
    end

    def show
      company = Company.find(params[:id])
      render json: company, status: :ok
    end

    def create
      company = Company.new(company_params)
      if company.save
        render json: company, status: 201
      else
        render json: company.errors, status: 422
      end
    end

    def update
      company = Company.find(params[:id])
      if company.update(company_params)
        render json: company, status: 200
      else
        render json: company.errors, status: 422
      end
    end

    def destroy
      company = Company.find(params[:id])
      company.destroy
      head 204
    end

    private
      def company_params
        params.require(:company).permit(:name)
      end
  end
end
