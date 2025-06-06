class RunsController < ApplicationController
  before_action :set_agent
  before_action :set_run, only: [:show]

  def show
  end

  def new
    @run = @agent.runs.build
  end

  def create
    @run = @agent.runs.build(run_params)
    @run.status = :pending
    @run.started_at = Time.now

    if @run.save
      @run.execute
      redirect_to agent_run_path(@agent, @run), notice: "Run was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    # Just use any model config
    # Set agent template
    # Run the thing

  end

  private

  def run_params
    params.require(:run).permit(:input_data)
  end

  def set_agent
    @agent = Agent.find(params[:agent_id])
  end

  def set_run
    @run = @agent.runs.find(params[:id])
  end
end