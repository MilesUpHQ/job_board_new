class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :check_user_job, only: %i[ edit update destroy ]

  def index
    if(params.has_key?(:job_type))
      @jobs = Job.where(job_type: params[:job_type]).order("created_at desc").page(params[:page]).per(2)
    else
      @jobs = Job.all.order("created_at desc").page(params[:page]).per(2)
    end
  end

  def new
    @job = current_user.jobs.new
  end


  def edit
  end

  def show
  end

  def create
    @job = current_user.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :url, :job_type, :location, :job_author, :remoke_ok, :apply_url, :avatar,:category,:perks,:twitter,:email)
    end

    def set_job
      @job = Job.find(params[:id])
    end
end
