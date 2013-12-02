# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

$: << "."
require 'think_bayes'
require 'hypothesis'
module ThinkBayes
  class Cookie < Suite
    HYPOS = Hypothesis.generate([
      ['Bowl 1', {:vanilla => 0.75, :chocolate => 0.25}],
      ['Bowl 2', {:vanilla => 0.5, :chocolate => 0.5}],
    ])


    def self.run
      suite = new(HYPOS.keys)
      # HYPOS.each {|hypo| suite.set(hypo, 1) }
      suite.update(:vanilla)
      suite.display
      return {:suite => suite, :hypos => HYPOS}
    end

    def likelihood(data, hypo)
      mix = HYPOS[hypo]
      like = mix[data]
    end
  end
end
