# encoding: utf-8
require "c3-dci/version"
require "c3-dci/helpers"
require "c3-dci/dci"

module C3DCI
  def self.version
    Version::STRING
  end
end

#include C3DCI::DCI::DSL