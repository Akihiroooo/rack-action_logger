require 'json'
require 'rack/action_logger/emit_adapter/base'

module Rack::ActionLogger::EmitAdapter
  class LoggerAdapter < Base
    def self.emit(hash)
      hash = wrap(hash)
      if Rack::ActionLogger.configuration.pretty_print
        Rack::ActionLogger.logger.info(hash)
        Rack::ActionLogger.logger.info("ここからエラーで落ちてくれるはず！")
        Rack::ActionLogger.logger.info(hash.to_s)
        # Rack::ActionLogger.logger.info(JSON.pretty_generate(hash))
      else
        Rack::ActionLogger.logger.info(hash)
      end
    end
  end
end
