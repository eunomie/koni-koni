# Welcome to KoniKoni
class WelcomeController < ApplicationController
  def index
    dates = Mood.dates
    @moods = ({
      dates[0] => [],
      dates[1] => []
    }).merge(Mood.by_date)
    @presented_moods = MoodsPresenter.from @moods, view_context
  end
end
