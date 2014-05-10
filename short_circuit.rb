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

end