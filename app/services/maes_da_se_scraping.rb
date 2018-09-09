require "open-uri"
require "nokogiri"

class MaesDaSeScraping
	def initialize(page=0)
		@url = "http://www.desaparecidos.gov.br"
		@page = page.to_s
	end

	def call
		doc = parsed_template(@url + "/index.php/desparecidos?page=#{@page}")
	end

	private
		def parsed_template(url)
			return Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
		end
end