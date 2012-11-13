class ModelsController < ActionController::Base
  auto_assignment

  attr_accessor :model, :models
  attr_accessor :params

  def initialize
    @params = {}
  end
end