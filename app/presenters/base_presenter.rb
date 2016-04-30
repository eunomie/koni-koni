# Default presenter.
# SimpleDelegator allow every unkown method call to be
# re-routed to the model.
class BasePresenter < SimpleDelegator
  def initialize(model, view)
    @model = model
    @view = view
    super(@model)
  end

  def h
    @view
  end
end
