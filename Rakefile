require "rake/testtask"
require "rake/clean"
require "rake/extensiontask"

Rake::ExtensionTask.new("strlen")

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
  t.warning = true
end
