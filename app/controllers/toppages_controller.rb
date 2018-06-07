class ToppagesController < ApplicationController
  before_action :set_categories, only: [:index]

  def index
    @my_diaries = current_user.diaries if user_signed_in?
  end

  private

    def set_categories
      @categories = Category.all
    end
end
