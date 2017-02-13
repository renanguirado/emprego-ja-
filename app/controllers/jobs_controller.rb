class JobsController < ApplicationController
  def show

    @job = Job.find(params[:id])
  end

  def new

    @companies = Company.all
    @job = Job.new

  end

  def create
    @companies = Company.all
    job_params = params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured )
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end
end
