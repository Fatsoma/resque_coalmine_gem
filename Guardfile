guard 'rspec', :all_on_start => true, :all_after_pass => false, :cli => "--require spec_helper.rb --color --format documentation --fail-fast --backtrace" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/resque_coalmine/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }
end