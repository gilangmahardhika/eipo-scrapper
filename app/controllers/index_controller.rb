class IndexController < ApplicationController
  def index
    @emitens = Emiten.all.page(params[:page] || 1).per(10)
  end
end
