class ResultsController < ApplicationController
  before_action :require_admin

  # GET /resultados/actualizar
  # GET /resultados/actualizar.json
  def index
    @matches = Match.all.group_by(&:group)
  end

  # POST /resultados/actualizar
  # POST /resultados/actualizar.json
  def create
    params.require(:result).each do |match_id, attrs|
      match = Match.find(match_id)
      match.update_attributes(attrs)
      # TODO: Update users' points
    end

    flash[:notice] = 'Resultados actualizados correctamente'
    redirect_to matches_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def results_params
    params.require(:result).permit(:team1_score, :team2_score, :match_id, :winner_id)
  end

  def require_admin
    unless current_member and current_member.is_admin
      redirect_to matches_path
    end
  end
end
