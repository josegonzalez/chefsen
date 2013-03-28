class Chef
  class Log
    # Shit up some bs from chef
    def self.warn(msg=nil, &block)
      if msg =~ /^(Cloning resource|Current  |Previous )/
        debug(msg, &block)
      else
        super
      end
    end

    # Shit up some bs from dmg_package and regurgitated things
    def self.info(msg=nil, &block)
      if msg =~ /^Already installed/
        debug(msg, &block)
      elsif msg =~ /already initialized/
        debug(msg, &block)
      else
        super
      end
    end
  end
end
