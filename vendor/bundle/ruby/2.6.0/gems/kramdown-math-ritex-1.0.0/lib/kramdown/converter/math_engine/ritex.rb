# -*- coding: utf-8; frozen_string_literal: true  -*-
#
#--
# Copyright (C) 2019 Thomas Leitner <t_leitner@gmx.at>
#
# This file is part of kramdown-math-ritex which is licensed under the MIT.
#++
#

require 'kramdown/converter'
require 'ritex'

module Kramdown::Converter #:nodoc:
  module MathEngine #:nodoc

    # Uses the Ritex library for converting math formulas to MathML.
    module Ritex

      VERSION = '1.0.0'

      def self.call(converter, el, opts)
        type = el.options[:category]
        result = ::Ritex::Parser.new.parse(el.value, display: (type == :block))

        attr = el.attr.dup
        attr.delete('xmlns')
        attr.delete('display')
        result.insert("<math".length, converter.html_attributes(attr))

        (type == :block ? "#{' ' * opts[:indent]}#{result}\n" : result)
      end

    end

  end

  add_math_engine(:ritex, MathEngine::Ritex)

end
