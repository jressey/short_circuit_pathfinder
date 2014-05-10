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

		@all_paths_for_a = 		[
								  [ 'A', 'B', 50],
								  [ 'A', 'D', 150]	
								]

		@path_for_sum_of_distances = [
										[ 'A', 'B', 50 ],
								  		[ 'B', 'C', 250],
									 ]

		@all_possible_paths = [[0], [0]] #dummy placeholder result											
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

	def test_find_all_paths_for_point
		assert_equal(@all_paths_for_a, ShortCircuit.get_all_paths_for_point('A', @input_path_segments))
	end

	def test_get_sum_of_all_paths_for_point
		assert_equal(50 + 250, ShortCircuit.get_sum_of_distances(@path_for_sum_of_distances))
	end

	def test_get_all_possible_paths
		assert_equal(@all_possible_paths, ShortCircuit.get_all_possible_paths(@input_path_segments))
	end
end