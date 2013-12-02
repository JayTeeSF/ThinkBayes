$: << "."
require 'think_bayes'
require 'hypothesis'
# This file contains code for use with "Think Bayes",
# by Allen B. Downey, available from greenteapress.com
# Copyright 2012 Allen B. Downey
# License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html
# converted to Ruby by JT

module ThinkBayes
  class MAndM < Suite
      MIX94 = {
        :brown => 30,
        :yellow => 20,
        :red => 20,
        :green => 10,
        :orange => 10,
        :tan => 10
      }

      MIX96 = {
        :blue => 24,
        :green => 20,
        :orange => 16,
        :yellow => 14,
        :red => 13,
        :brown => 13
      }

      HYPOS = Hypothesis.generate([
        ['A', {:bag1 => MIX94, :bag2 => MIX96}],
        ['B', {:bag1 => MIX96, :bag2 => MIX94}]
      ])

    def self.run
      suite = new(HYPOS.keys)
      suite.update([:bag1, :yellow])
      suite.update([:bag2, :green])
      suite.display
      return {:suite => suite, :hypos => HYPOS}
    end

    def likelihood(data, hypo)
      # puts "\n\tlikelihood called with #{data.inspect} for #{hypo}"
      bag, color = data
      # puts "\n\tbag: #{bag}, color #{color}"
      mix = HYPOS[hypo][bag]
      like = mix[color]
    end
  end
end
