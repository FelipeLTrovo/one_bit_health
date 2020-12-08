class HomeController < ApplicationController
  skip_load_and_authorize_resource
  before_action { authorize!(params[:action].to_sym, :home) }

  def index
  end
end
