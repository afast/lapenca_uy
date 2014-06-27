class Forecast < ActiveRecord::Base
  belongs_to :member
  belongs_to :match
  belongs_to :team1, :class_name => 'Team'
  belongs_to :team2, :class_name => 'Team'

  def self.update_user_points(match)
    match.forecasts.each do |forecast|
      forecast.member.add_points forecast.calculate_points
    end
  end

  def calculate_points
    if team1_score.present? && team2_score.present?
      @@points_logger ||= Logger.new("#{Rails.root}/log/member_points.log")
      points = 0
      reasons = []
      if match.team1_score.present? && match.team2_score.present?
        if match.result_sym == result_sym && correct_match?
          points += 20
          reasons << :winner_draw
        end
        if match.team1_score == team1_score && correct_match?
          points += 10
          reasons << :team1_score
        end
        if match.team2_score == team2_score && correct_match?
          points += 10
          reasons << :team2_score
        end
        if match.team1_score == team1_score && match.team2_score == team2_score && correct_match?
          points += 10
          reasons << :exact_result
        end
        if !correct_match? && winner_id.present? && winner_id == match.winner_id
          points += 20
          reasons << :advancing_team
        end
      end

      member_info = member.try(:full_name) || 'Unknown'

      @@points_logger.info("#{match.try :description}")
      @@points_logger.info("#{member_info} forecasted (#{description}) and scores #{points} points (#{reasons.to_sentence})")

      points
    else
      0
    end
  end

  def correct_match?
    match.stage == 32 || match.stage == 16 || (team1_id == match.team1_id && team2_id == match.team2_id)
  end

  def description
    "#{team1_score} - #{team2_score}"
  end

  def team1_data
    points = if team1_score > team2_score
      3
    elsif team1_score == team2_score
      1
    else
      0
    end
    {gf: team1_score, ga: team2_score, points: points}
  end

  def team2_data
    points = if team2_score > team1_score
      3
    elsif team1_score == team2_score
      1
    else
      0
    end
    {gf: team2_score, ga: team1_score, points: points}
  end

  def result_sym
    if draw?
      :draw
    else
      if team1_score > team2_score
        :team1
      else
        :team2
      end
    end
  end

  def draw?
    team1_score == team2_score
  end

  def loser_id
    if winner_id == team1_id
      team2_id
    elsif winner_id == team2_id
      team1_id
    end
  end
end
