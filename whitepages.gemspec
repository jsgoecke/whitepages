Gem::Specification.new do |s|
  s.name = "whitepages"
  s.version = "0.1.1"
  s.summary = "Ruby Library for the Whitepages API"
  s.description = "Ruby Library for the Whitepages API - http://www.whitepages.com"
  s.authors = ["Jason Goecke"]
  s.email = ["jason@goecke.net"]
 
  s.files = ["lib/whitepages.rb", 
             "LICENSE", 
             "README.textile", 
             "whitepages.gemspec"]
  s.require_paths = ["lib"]
 
  s.add_dependency("json_pure", ">=", "1.1.2")
end