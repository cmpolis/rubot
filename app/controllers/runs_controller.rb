class RunsController < ApplicationController
  before_action :set_agent
  before_action :set_run, only: [:show]

  def show
  end

  def new
    @run = @agent.runs.build
  end

  private

  def set_agent
    @agent = Agent.find(params[:agent_id])
  end

  def set_run
    @run = @agent.runs.find(params[:id])
  end
end