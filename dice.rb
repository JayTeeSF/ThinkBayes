# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

$: << "."
require 'think_bayes'
require 'Train'
module ThinkBayes
  class Dice < Train
    SIDED_DICE = [4,6,8,12,20]
    def self.run
      hypos = SIDED_DICE
      suite = new(hypos)
      data = [6]
      datum = data.first
      suite.update(datum)
      suite.display

      subsequent_data = [6,8,7,7,5,4]
      subsequent_data.each do |datum|
        suite.update(datum)
      end
      suite.display
      data += subsequent_data
      return {:suite => suite, :hypos => hypos, :data => data}
    end
  end
end
