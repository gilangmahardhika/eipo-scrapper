class IndexController < ApplicationController
  before_action :upcase_code, only: :show
  def index
    @emitens = Emiten.all.page(params[:page] || 1).per(10)
  end

  def show
    @emiten = Emiten.find_by(code: @code)
  end

  private
    def upcase_code
      @code = params[:code].upcase
    end
end
