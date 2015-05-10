module ApplicationHelper
  require "#{Rails.root.join('lib', 'nengo_errors')}"
  include NengoErrors
end
