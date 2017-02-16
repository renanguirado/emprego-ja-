class JobsController < ApplicationController

  before_action :job_find, only: [:show, :edit, :update ]

  def show
  end

  def new

    @companies = Company.all
    @job = Job.new
    @categories = Category.all

  end

  def create
    job_params = params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured )
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @categories = Category.all
      @companies = Company.all
      flash[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    @companies = Company.all
  end

  def update
    job_params = params.require(:job).permit(:title, :location, :category_id, :description, :company_id)

    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      flash[:error] = 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  private

  def job_find
    @job = Job.find(params[:id])
  end
end
