class PagesController < ApplicationController
  def home
    @agents = Agent.all
  end
end
