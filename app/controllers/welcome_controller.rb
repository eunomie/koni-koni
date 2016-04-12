# Welcome to KoniKoni
class WelcomeController < ApplicationController
  def index
    @mood = Mood.new
  end
end
