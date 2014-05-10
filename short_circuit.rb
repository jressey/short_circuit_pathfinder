module ShortCircuitPathfinder
	class ShortCircuit
		
		def initialize
			@path_segment_controller = PathSegmentsController.new
		end

		def find_shortest_path(path_segments)
			@path_segments = path_segments
		end

		def get_sum_of_distances(path_segments)
			return path_segments.inject(0) { |sum,p| sum + p[2] }
		end

		def get_all_possible_paths(path_segments)
			return @path_segment_controller.get_all_possible_paths(path_segments)
		end

	end

	class PointExtractor

		def self.extract_points(path_segments)
			points = Array.new
			path_segments.each do |p|
				points.push(p[0], p[1])
			end
			points.uniq!
		end
	end

	class PathSegmentsController
		@path_segments = []

		def get_all_path_segments
			@path_segments
		end

		def get_all_possible_paths(path_segments)
			set_all_path_segments(@path_segments)
			array_of_point_paths = Array.new
			PointExtractor.extract_points(path_segments).each do |p|
				array_of_point_paths.push(p => get_all_paths_for_point(p, path_segments))
			end
			array_of_point_paths
		end

		def set_all_path_segments(path_segments)
			@path_segments = path_segments
		end

		def get_all_paths_for_point(point_letter, path_segments)
			return path_segments.select { |p| p[0] == point_letter }
		end

		#need to make an array of all possible paths then add up the numbers to find the lowest sum
		#then compare that array to the original path segments array and return those paths which are not included

		#make the array by starting at a, getting the first paths [1] value unless that path is already represented

		def get_first_path_for_all_path_segments
		end
	
	end
end