class Hash
	class << self
		def from_xml(rexml)
			xml_elem_to_hash rexml.root
		end

		def xml_elem_to_hash(elem)
			value = if elem.has_elements?
								children = {}
								elem.each_element do |e|
									children.merge!(xml_elem_to_hash(e)) do |k,v1,v2|
										v1.class == Array ? v1 << v2 : [v1,v2]
									end
								end
								children
							else
								elem.text
							end
			{ elem.name.to_sym => value  }
		end
	end
end
