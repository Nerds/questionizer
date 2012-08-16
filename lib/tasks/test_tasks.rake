namespace :spec do
  Rake::TestTask.new(:functionals) do |t|
    t.libs << 'spec'
    t.pattern = 'spec/functional/**/*_spec.rb'
  end

  Rake::TestTask.new(:integration) do |t|
    t.libs << 'spec'
    t.pattern = 'spec/integration/**/*_spec.rb'
  end

  Rake::TestTask.new(:units) do |t|
    t.libs << 'spec'
    t.pattern = 'spec/unit/**/*_spec.rb'
  end
end

namespace :test do
  task :run do
    test_groups = %w(spec:units spec:functionals spec:integration)
    errors = test_groups.collect do |task|
      begin
        Rake::Task[task].invoke
        nil
      rescue => e
        { task: task, exception: e }
      end
    end.compact

    if errors.any?
      puts errors.map { |e| "Errors running #{e[:task]}! #{e[:exception].inspect}" }.join("\n")
      abort
    end
  end
end