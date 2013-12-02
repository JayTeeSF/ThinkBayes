# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

$: << "."
require 'think_bayes'
module ThinkBayes
  class Monty < Suite
    def self.run
      hypos = "ABC"
      data = "B"
      suite = new(hypos)
      suite.update(data)
      suite.display
      return {:suite => suite, :hypos => hypos, :data => data}
    end


    def likelihood(data, hypo)
      return 0 if hypo == data
      return 0.5 if hypo == "A"
      return 1
    end
  end
end
