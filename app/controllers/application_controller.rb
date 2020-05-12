class ApplicationController < ActionController::Base
  before_action :basic
  protect_from_forgery with: :exception

  private
  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_USER'] && password == ENV['BASIC_PASS']
    end
  end
end
