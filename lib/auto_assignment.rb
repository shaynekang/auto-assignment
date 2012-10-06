require 'action_controller'

module AutoAssignment
  VERSION = "0.0.1"

  module ClassMethods
    def auto_assignment(resource_name=nil, options={})
      resource_name = controller_name.singularize unless resource_name
      resource_name = resource_name.to_s

      before_filter do |controller|
         auto_assignment(resource_name, options)
      end
    end
  end

  def auto_assignment(resource_name, options)
    collection_name = resource_name.tableize
    model_name = collection_name.classify.constantize

    collection = model_name.scoped
    resource =  if params[:id].blank?
                  collection.new
                else
                  collection.find(params[:id])
                end

    if params[:post]
      resource.attributes = params[:post]
    end

    instance_variable_set('@posts', collection)
    instance_variable_set('@post', resource)
  end

  def self.included(base)
    base.extend ClassMethods
  end
end

ActiveSupport.on_load(:action_controller) do
  include AutoAssignment
end