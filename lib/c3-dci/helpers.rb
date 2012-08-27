# encoding: utf-8

module C3DCI
  module Helpers
    extend self

    def camelize! literal
      literal.to_s.
        sub(/^(.)/){$1.upcase}.
        gsub(/[_](.)/){$1.upcase}.
        gsub(/(\/|::)(.)/){'::'+$2.upcase}
    end

    def constantize! literal
      pieces = literal.to_s.split('::')
      pieces.inject(Object) do |parent, child|
        parent = parent.const_get(child)
      end
    end

    def objectify! literal
      constantize! camelize! literal
    end

    def rolefy! literal
      type = camelize!(literal)
      constantize!(type.include?("Role") ? type : type + "Role")
    end

  end
end
