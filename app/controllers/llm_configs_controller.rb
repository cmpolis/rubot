class LlmConfigsController < ApplicationController
  before_action :set_llm_config, only: [:edit, :update, :show, :destroy]

  def index
    @llm_configs = LlmConfig.all
  end

  def new
    @llm_config = LlmConfig.new
  end

  def create
    @llm_config = LlmConfig.new(llm_config_params)

    if @llm_config.save
      redirect_to llm_configs_path, notice: 'LLM configuration was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @llm_config.update(llm_config_params)
      redirect_to llm_configs_path, notice: 'LLM configuration was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @llm_config.destroy!
    redirect_to llm_configs_path, notice: 'LLM configuration was successfully destroyed.'
  end

  private

    def set_llm_config
      @llm_config = LlmConfig.find(params[:id])
    end

    def llm_config_params
      params.require(:llm_config).permit(:provider,
                                         :version,
                                         :default_parameters, :name)
    end
end