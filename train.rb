# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

$: << "."
require 'think_bayes'
module ThinkBayes
  class Train < Suite
    def self.run hypos = 1..1000
      # def hypos.empty?; !self.first; end
      suite = new(hypos)
      data = [60]
      suite.updates(data)

      suite.display
      puts "mean: #{suite.mean}"

      subsequent_data = [30, 90]
      suite.updates(subsequent_data)
      puts "mean: #{suite.mean}"
      data += subsequent_data

      return {:suite => suite, :hypos => hypos, :data => data}
    end

    # power law distribution of company sizes
    # thanks to:
    # http://www.sciencemag.org/content/293/5536/1818.full.pdf
    def initialize(hypos, alpha=1.0)
      super
      hypos.each {|hypo| set(hypo, hypo**(-alpha)) }
      normalize
    end

    def likelihood(data, hypo)
      return 0 if hypo < data
      return 1.0/hypo
    end
  end
end
