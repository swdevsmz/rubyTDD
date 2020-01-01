require 'minitest/autorun'
require_relative 'bowling_game'

class BowlingGameTest < MiniTest::Unit::TestCase

    def setup
        @game = BowlingGame.new
    end


    def test_all_gutter_game
        
        20.times do
            @game.record_shot(0)
        end
        assert_equal 0, @game.score
    end

    def test_all_one_pin_game
        
        20.times do
            @game.record_shot(1)
        end
        assert_equal 20, @game.score
    end

    def record_many_shots(count, pins)
        count.times do
            @game.record_shot(pins)
        end
    end

    def test_spare
        @game.record_shot(3)
        @game.record_shot(7) # 10 + 4 = 14
        @game.record_shot(4)
        record_many_shots(17,0)
        assert_equal 18, @game.score
    end

    def test_spare_over_frame
        @game.record_shot(2)
        @game.record_shot(5)
        @game.record_shot(5) # 前の投球との合計は10だけどスペアではない
        @game.record_shot(1)
        record_many_shots(16,0)
        assert_equal 13, @game.score
    end
end