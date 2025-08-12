class WelcomeController < ApplicationController
  include ActionController::MimeResponds

  def index
    @title =  "snake_api"
    @copyright = "copyright (c) 2024 Guxiaobai <sikuan.gu@gmail.com>"
    respond_to :json, :html
  end
end