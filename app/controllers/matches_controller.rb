class MatchesController < ApplicationController
  def index
    @matches = Match.all.group_by(&:group)
  end

  def show
  end
end
