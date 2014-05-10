class ShortCircuit
	
	def self.find_shortest_path(path_segments)
		@path_segments = path_segments
		start_point = get_start_point(path_segments)
		end_point = get_end_point(path_segments)
	end


	def self.get_start_point(path_segments)
		return path_segments.sort{ |a,b| a[0]<=>b[0] }[0][0]
	end

	def self.get_end_point(path_segments)
		return path_segments.sort{ |a,b| a[1]<=>b[1] }[path_segments.size - 1][1]
	end

	def self.get_all_paths_for_point(point_letter, path_segments)
		return path_segments.select { |p| p[0] == point_letter }
	end

	def self.get_sum_of_distances(path_segments)
		return path_segments.inject(0) { |sum,p| sum + p[2] }
	end

	def self.get_all_possible_paths(path_segments)
		#the rule: use endpoint of path_segment to get startpoint of next path_segment.
		points = self.get_all_points(path_segments)
		return self.get_all_paths_for_all_points(points, path_segments)
	end

	def self.get_all_points(path_segments)
		points = Array.new
		path_segments.each do |p|
			points.push(p[0], p[1])
		end
		return points.uniq!
	end

	def self.get_all_paths_for_all_points(point_letters, path_segments)
		array_of_point_paths = Array.new
		point_letters.each do |p|
			array_of_point_paths.push(p, self.get_all_paths_for_point(p, path_segments))
		end
		return array_of_point_paths
	end

end

	class point
		def get_all_paths_for_point(point)
		end
	end