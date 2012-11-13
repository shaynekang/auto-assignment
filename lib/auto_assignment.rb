require 'action_controller'

module AutoAssignment
  VERSION = "0.0.2"

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
    resource_name = resource_name.to_sym
    collection_name = resource_name.to_s.tableize
    model = collection_name.classify.constantize

    collection = model.scoped
    resource =  if params[:id].blank?
                  collection.new
                else
                  collection.find(params[:id])
                end

    if params[resource_name]
      resource.attributes = params[resource_name]
    end

    instance_variable_set("@#{collection_name}", collection)
    instance_variable_set("@#{resource_name}", resource)
  end

  def self.included(base)
    base.extend ClassMethods
  end
end

ActiveSupport.on_load(:action_controller) do
  include AutoAssignment
end