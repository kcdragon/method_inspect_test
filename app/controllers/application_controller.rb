class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_method_log

  def set_method_log
    @method_log = Hash.new
  end

  def _process_options(options)
    @_rendered_template_options = options
  end

  def view_assigns
    hash = super

    hash_with_decorators = {}
    hash.each do |name, variable|
      hash_with_decorators[name] = MethodCallDecorator.new(variable, params.merge(@_rendered_template_options))
    end

    hash_with_decorators
  end
end
