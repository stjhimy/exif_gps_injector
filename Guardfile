guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^lib/(.+)\.rb$}) { 'spec' }
  watch(%r{^spec/(.+)\.rb$}) { 'spec' }
end

guard :rubocop do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
