# -*- encoding: utf-8 -*-
# stub: kramdown-math-itex2mml 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kramdown-math-itex2mml".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Leitner".freeze]
  s.date = "2019-01-12"
  s.email = "t_leitner@gmx.at".freeze
  s.homepage = "https://github.com/kramdown/math-itex2mml".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "kramdown-math-itex2mml uses itex2mml to convert math elements to MathML".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<kramdown>.freeze, ["~> 2.0"])
    s.add_runtime_dependency(%q<itextomml>.freeze, ["~> 1.5"])
  else
    s.add_dependency(%q<kramdown>.freeze, ["~> 2.0"])
    s.add_dependency(%q<itextomml>.freeze, ["~> 1.5"])
  end
end
