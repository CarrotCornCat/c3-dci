# encoding: utf-8

module C3DCI
  module DCI
    module Type

      Data = Class.new
      Role = Module.new

      class Context
        # helper method to instantiate and call 'call' a context in one step
        # the 'call' instance method MUST BE implemented!
        def self.call *args
          if args.empty?
            new.call
          else
            new(*args).call
          end
        end
      end

    end
  end
end
