module Jekyll
	module HtmlCompressor
		def htmlCompressor(data)
			#data.gsub("\n", "").gsub("\t", "").gsub(/<!--(?!<!)[^\[>].*?-->/, "")
			data.gsub(/<!--(?!<!)[^\[>].*?-->/, "")
		end
	end
end

Liquid::Template.register_filter(Jekyll::HtmlCompressor)