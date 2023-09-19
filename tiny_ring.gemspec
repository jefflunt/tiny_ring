Gem::Specification.new do |s|
  s.name        = "tiny_ring"
  s.version     = "1.0.0"
  s.description = "a tiny ring buffer implementation"
  s.summary     = "a tiny ring buffer implementation that is memory efficient"
  s.authors     = ["Jeff Lunt"]
  s.email       = "jefflunt@gmail.com"
  s.files       = ["lib/tiny_ring.rb"]
  s.homepage    = "https://github.com/jefflunt/tiny_ring"
  s.license     = "MIT"

  s.add_development_dependency 'minitest'
end
