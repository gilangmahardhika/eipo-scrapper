class IndexController < ApplicationController
  before_action :upcase_code, only: :show
  def index
    @emitens = if params[:search].present?
      Emiten.where(code: params[:search].upcase)
    else
      Emiten.all.page(params[:page] || 1).per(10)
    end
  end

  def show
    @emiten = Emiten.find_by(code: @code)
  end

  private
    def upcase_code
      @code = params[:code].upcase
    end
end
