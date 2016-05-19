# Misc helpers
module ApplicationHelper
  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new model, self
    yield(presenter) if block_given?
  end

  def class_for_mood_value(value)
    css = case value
          when 5..10
            "good"
          when -5..5
            "normal"
          when -10..-5
            "bad"
          else
            "empty"
          end
    "#{css} mood-#{value.to_i}"
  end

  def mood_chart(moods, dates)
    haml_tag :ul, class: 'mood_graph' do
      dates.first.upto dates.last do |date|
        mood_value = moods[date]
        haml_tag :li,
          class: ['day', class_for_mood_value(mood_value)],
          title: date,
          'data-date' => date,
          'data-mood-value' => mood_value.to_i,
          'data-toggle' => 'tooltip'
      end
    end
  end
end
