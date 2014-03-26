class MethodCallDecorator

  cattr_accessor :logger
  self.logger = Logger.new('log/method_calls.log')

  attr_reader :object, :params

  def initialize(object, params)
    @object = object
    @params = params
  end

  def method_missing(method, *args, &block)
    log_method_call(method)
    object.send(method, *args, &block)
  end

  def respond_to?(method, *args)
    object.respond_to?(method, *args) || super
  end

  def method(method)
    object.method(method)
  end

  private

  def log_method_call(method)
    logger.info "view_#{params[:prefixes].reverse.join('_')}_#{params[:template]}"
    logger.info "  #{method}"
    logger.info "  - #{object.method(method).source_location}"
  end
end
