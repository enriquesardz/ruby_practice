require 'net/http'

url = URI.parse('http://rubyinside.com/')
response = Net::HTTP.start(url.host, url.port) do |http|
  http.get(url.path)
end

content = response.body
puts content.inspect
