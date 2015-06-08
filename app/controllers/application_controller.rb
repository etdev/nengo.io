class ApplicationController < ActionController::Base
  #include Monban::ControllerHelpers
  require "#{Rails.root.join('lib', 'nengo_errors')}"
  protect_from_forgery with: :exception
end
