# frozen_string_literal: true

# Static Pages controller
class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end

  def help; end

  def about; end

  def contact; end
end
