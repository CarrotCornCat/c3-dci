# encoding: utf-8

module C3DCI
  module DCI
    module DSL

      # you can also use your basic model type
      # this is a nice helper for POROs
      def data name, &block
        klass_name = camelize_me! "#{name.to_s}_data"
        klass      = Class.new ::C3DCI::DCI::Type::Data, &block
        parent, child = parent_and_child klass_name
        parent.const_set child, klass
      end

      def role name, &block
        module_name = camelize_me! "#{name.to_s}_role"
        module_defs = Module.new do
          include ::C3DCI::DCI::Type::Role
        end
        module_defs.module_eval &block
        parent, child = parent_and_child module_name
        parent.const_set child, module_defs
      end


      def context name, &block
        klass_name = camelize_me! "#{name.to_s}_context"
        klass      = Class.new ::C3DCI::DCI::Type::Context, &block
        parent, child = parent_and_child klass_name
        parent.const_set child, klass
      end

    private

      def camelize_me! string
        ::C3DCI::Helpers.camelize! string
      end

      def parent_and_child string
        child, *parent = ::C3DCI::Helpers.camelize!(string).split("::").reverse
        parent         = parent.reverse.join("::")
        parent_object  = parent.empty? ? Object : ::C3DCI::Helpers.constantize!(parent)

        [parent_object, child]
      end

    end
  end
end
