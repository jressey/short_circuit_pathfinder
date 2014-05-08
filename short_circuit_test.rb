require_relative "short_circuit"
require "test/unit"


class TestShortCircuit < Test::Unit::TestCase
	
	def setup
		@input_path_segments = [
								   [ 'A', 'B', 50],
								   [ 'A', 'D', 150],
								   [ 'B', 'C', 250],
								   [ 'B', 'E', 250],
								   [ 'C', 'E', 350],
								   [ 'C', 'D', 50],
								   [ 'C', 'F', 100],
								   [ 'D', 'F', 400],
								   [ 'E', 'G', 200],
								   [ 'F', 'G', 100],
								]

		@output_path_segments = [
								  [ 'A', 'B', 50 ],
								  [ 'B', 'C', 250],
								  [ 'B', 'E', 250],
								  [ 'C', 'E', 350],
								  [ 'D', 'F', 400],
								  [ 'E', 'G', 200],
								]				
	end

	def test_short_circuit_pathfinder
		assert_equal(@path_segments, ShortCircuit.find_shortest_path(@input_path_segments))
	end

	def test_get_start_point
		assert_equal('A', ShortCircuit.get_start_point(@input_path_segments))
	end

	def test_get_end_point
		assert_equal('G', ShortCircuit.get_end_point(@input_path_segments))
	end
end