# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @random_article = Article.order(Arel.sql('RANDOM()')).first
  end
end
