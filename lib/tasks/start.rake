desc "Start foreman with its config"
task :start_foreman do
  exec 'foreman start -p 3000'
end
