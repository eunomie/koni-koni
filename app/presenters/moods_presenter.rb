# Presenter to compute a value of an
# array of moods
class MoodsPresenter < BasePresenter
  def compute
    MoodsPresenter.average(@model.map { |mood| MoodPresenter.new(mood, h).to_num })
  end

  def self.average(nums)
    nums.sum / nums.size
  end
end
