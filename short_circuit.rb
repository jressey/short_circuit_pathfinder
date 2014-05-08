class ShortCircuit
	
	def self.find_shortest_path(path_segments)
		start_point = get_start_point(path_segments)
		end_point = get_end_point(path_segments)
	end


	def self.get_start_point(path_segments)
		return path_segments.sort{ |a,b| a[0]<=>b[0] }[0][0]
		
	end

	def self.get_end_point(path_segments)
		return path_segments.sort{ |a,b| a[1]<=>b[1] }[path_segments.size - 1][1]
	end

end