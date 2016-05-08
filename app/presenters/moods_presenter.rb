# Presenter to compute a value of an
# array of moods
class MoodsPresenter < BasePresenter
  def compute
    MoodsPresenter.average(@model.map { |mood| MoodPresenter.new(mood, h).to_num })
  end

  def self.average(nums)
    if nums.empty?
      nil
    else
      nums.sum / nums.size
    end
  end

  def self.from(moods, h)
    mood_to_presenter = -> (_, mood, _) { MoodsPresenter.new(mood, h).compute }
    moods.update moods, &mood_to_presenter
  end
end
