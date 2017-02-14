class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:name, :location, :mail, :phone)
    @company = Company.create(company_params)
    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
  end

end
