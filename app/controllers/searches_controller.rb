class SearchesController < ApplicationController
before_action :set_search, only: [:show, :edit]
  def new
    @search = Search.new
  end
  def show; end
  def edit; end

  private

  def set_search
    @search = Search
  end

end