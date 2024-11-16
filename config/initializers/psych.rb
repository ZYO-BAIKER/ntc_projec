require "psych"

module Psych
  class << self
    alias_method :old_safe_load, :safe_load

    def safe_load(yaml, permitted_classes: [], permitted_symbols: [], aliases: false, **kwargs)
      old_safe_load(yaml, permitted_classes: permitted_classes, permitted_symbols: permitted_symbols, aliases: true, **kwargs)
    end
  end
end
