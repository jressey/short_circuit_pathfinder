module ShortCircuitPathfinder
	class ShortCircuit
		
		def initialize
			@point_controller = PointController.new
			@path_segment_controller = PathSegmentsController.new
		end

		def find_shortest_path(path_segments)
			@path_segments = path_segments
		end

		def get_all_paths_for_point(point_letter, path_segments)
			return path_segments.select { |p| p[0] == point_letter }
		end

		def get_sum_of_distances(path_segments)
			return path_segments.inject(0) { |sum,p| sum + p[2] }
		end

		def get_all_possible_paths(path_segments)
			return self.get_all_paths_for_all_points(path_segments)
		end

		def get_all_paths_for_all_points(path_segments)
			array_of_point_paths = Array.new
			@point_controller.extract_points(path_segments).each do |p|
				array_of_point_paths.push(p, self.get_all_paths_for_point(p, path_segments))
			end
			return array_of_point_paths
		end

	end

	class PointController

		def extract_points(path_segments)
			points = Array.new
			path_segments.each do |p|
				points.push(p[0], p[1])
			end
			points.uniq!
		end
	end

	class PathSegmentsController
		@path_segments = []
		
		def set_all_path_segments(path_segments)
			@path_segments = path_segments
		end

		def get_all_path_segments
			@path_segments
		end

	end
end