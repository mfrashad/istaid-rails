class Admin::BaseController < ApplicationController
  before_action :require_admin
  layout 'layouts/admin'
end
