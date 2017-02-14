class JobsController < ApplicationController
  def show

    @job = Job.find(params[:id])
  end

  def new

    @companies = Company.all
    @job = Job.new

  end

  def create
    job_params = params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured )
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      @companies = Company.all
      flash[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit

    @job = Job.find(params[:id])
    @companies = Company.all

  end

  def update
    @job = Job.find(params[:id])
    job_params = params.require(:job).permit(:title, :location, :category, :description, :company_id)

    if @job.update(job_params)
      redirect_to @job
    else
      @companies = Company.all
      flash[:error] = 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

end
