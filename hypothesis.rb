# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

require 'think_bayes'
module ThinkBayes
  class Hypothesis
    def self.generate(hypos=[])
      results = {}
      hypos.each{|hypo|
        got = new(*hypo)
        results[got.name] = got.value
      }
      results
    end

    attr_reader :name, :value
    def initialize k,v
      @name = k
      @value = v
    end

    def to_s
      name
    end
  end
end
