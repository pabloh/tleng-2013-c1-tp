file 'lib/tleng_tp/parser.rb' => 'lib/tleng_tp/parser.rb.y' do |t|
  puts t.class
  sh "racc -l -o #{t.name} #{t.prerequisite_tasks.first.name}"
end

task :compile => 'lib/tleng_tp/parser.rb'
