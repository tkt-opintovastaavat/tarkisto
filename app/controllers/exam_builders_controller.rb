class ExamBuildersController < ApplicationController

  load_and_authorize_resource

  before_filter :set_tab_as_new

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_tab_as_new
    set_tab :new
  end

end
