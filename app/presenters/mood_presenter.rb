class MoodPresenter < BasePresenter
  @@num_feelings = {
    'good' => 10.0,
    'ordinary' => 0.0,
    'bad' => -10.0
  }

  def to_num
    @@num_feelings[@model.feeling]
  end
end
