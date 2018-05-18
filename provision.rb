#recursively require all files in directory but skip paths that match a pattern
$stdout.sync = true

Dir["#{File.dirname(__FILE__)}/provision/??_*.rb"].each do |file|
  $stdout.puts File.basename(file, '.rb')
  require file
  $stdout.puts "\n"
end