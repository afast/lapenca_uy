class Member < ActiveRecord::Base
  SECOND_STAGE_FIRSTS = {
    FA: 1,
    FB: 3,
    FC: 2,
    FD: 4,
    FE: 5,
    FF: 7,
    FG: 6,
    FH: 8
  }

  SECOND_STAGE_SECONDS = {
    SA: 3,
    SB: 1,
    SC: 4,
    SD: 2,
    SE: 7,
    SF: 5,
    SG: 8,
    SH: 6
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :forecasts
  has_many :member_subscriptions
  has_many :member_groups, through: :member_subscriptions

  def add_points(points)
    self.points_to_add ||= 0
    self.points_to_add += points
    self.save
  end

  def assign_points
    if (self.points_to_add > 0)
      self.points = self.points || 0
      self.points += self.points_to_add

      self.points_to_add = 0

      self.save
    end
  end

  def recalculate_points
    log = Logger.new("#{Rails.root}/log/member_points.log")
    log.info("Recalculating points for #{name} - #{email}")
    points = forecasts.includes(:match).map { |f| f.calculate_points }.inject(:+)
    points += points_for_predicting_second_stage
    update_attributes({points: points, points_to_add: 0})
    log.info("Done #{name || email} has #{points || 0} points.")
  end

  def points_for_predicting_second_stage
    points = (16 - (qualified - predicted_ids).size) * 20
    SECOND_STAGE_FIRSTS.each do |key, value|
      points += 10 if predicted_position?(:first, value)
    end
    SECOND_STAGE_SECONDS.each do |key, value|
      points += 10 if predicted_position?(:second, value)
    end
    points
  end

  def predicted_position?(side, pos_in_stage)
    match = Match.where(stage: 16, pos_in_stage: pos_in_stage).first
    case side
    when :first
      match.team1_id == predicted[match.group][0]
    when :second
      match.team2_id == predicted[match.group][1]
    end
  end

  def qualified
    Match.where(stage: 16, pos_in_stage: pos_in_stage).map { |m| [m.team1_id, m.team2_id] }.flatten
  end

  def predicted_ids
    predicted.map { |k,v| v[0..1] }.flatten
  end

  def predicted
    return @predicted if @predicted
    @predicted = {}
    ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'].each do |group|
      @predicted[group] = {}
      forecasts.includes(:match).where('matches.group' => group).each do |f|
        if @predicted[group][f.match.team1_id]
          @predicted[group][f.match.team1_id] = f.team1_data
        else
          f.team1_data.each do |k,v|
            @predicted[group][f.match.team1_id][k] += v
          end
        end

        if @predicted[group][f.match.team2_id]
          @predicted[group][f.match.team2_id] = f.team2_data
        else
          f.team2_data.each do |k,v|
            @predicted[group][f.match.team2_id][k] += v
          end
        end
      end

      @predicted[group] = @predicted[group].sort do |a,b|
        if a[1][:points] > b[1][:points]
          -1
        elsif a[1][:points] < b[1][:points]
          1
        else
          if (a[1][:gf] - a[1][:ga]) > (b[1][:gf] - b[1][:ga])
            -1
          elsif (a[1][:gf] - a[1][:ga]) < (b[1][:gf] - b[1][:ga])
            1
          else
            if a[1][:gf] > b[1][:gf]
              -1
            elsif a[1][:gf] < b[1][:gf]
              1
            else
              if a[1][:ga] < b[1][:ga]
                -1
              elsif a[1][:ga] > b[1][:ga]
                1
              else
                0
              end
            end
          end
        end
      end.map { |e| e[0] }
    end
    @predicted
  end

  def full_name
    if name
      "#{name} - #{email}"
    else
      email
    end
  end
end
