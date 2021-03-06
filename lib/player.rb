#***********************************************************
#Class Player in Scrabble Module:

require_relative 'scoring'

module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @tiles= []
    end

# _________________DRAW TILES METHOD____________________
# Randomly chooses as many possible words (max 7) that the player can still draw from the tiles bag by calling the draw_tiles method from the TileBag class.

    def draw_tiles(tile_bag)
      @tiles = tile_bag.draw_tiles(7 - @tiles.count)
      return @tiles
    end


# _________________PLAY METHOD____________________
# Accepts a word as an argument and add it to the plays array.

    def play(word)
      return nil if word == nil || word.match?(/\W|\s/) || word.length > 7 || word.length == 0

      won? ? false : @plays << word
    end

# _________________TOTAL SCORE METHOD____________________
#  Calculates and returns the toal score of the words in the plays array by calling the score method of the class Scoring.

    def total_score
      sum_of_scores = 0
      @plays.each do |word|
        score = Scoring.score(word)

        sum_of_scores += score
      end
      return sum_of_scores
    end

# _________________WON? METHOD____________________
# Returns true if the toal score is more than 100, otherwise returns false.

    def won?
      total_score > 100 ? true : false
    end

# ___________HIGHEST SCORING WORD METHOD________________
# Returns the highest scoring played word.

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

# ______________HIGHEST WORD SCORE METHOD__________________
# Returns the score of the highest scored word.

    def highest_word_score
      return  Scoring.score(highest_scoring_word)
    end
  end
end
