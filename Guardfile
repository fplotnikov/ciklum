guard 'rspec', notification: false, all_on_start: true, spec_paths: ['spec', 'cookbooks/*/spec'], cmd: 'rspec --format documentation --color'  do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb') { 'spec' }
  watch(%r{^cookbooks/(.+)/recipes/(.+)\.rb$}) do |m|
    "cookbooks/#{m[1]}/spec/#{m[2]}_spec.rb"
  end
  watch(%r{^cookbooks/([A-Za-z]+)/(.+)(\..*)?$}) do |m|
    "cookbooks/#{m[1]}/spec/*.rb"
  end
end
