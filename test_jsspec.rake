
# Replace the path to js.jar with something that works in your environment
namespace :test do  
  desc "Runs all the JSSpec tests and collects the results"
  task :jsspec do
    Dir.chdir("test/javascripts") do
      all_fine = true
      if ENV["TEST"]
        all_fine = false unless system("java -jar ~/TOOLS/rhino1_7R1/js.jar #{ENV["TEST"]}")
      else
        Dir.glob("spec*.js").each do |file|
          all_fine = false unless system("java -jar ~/TOOLS/rhino1_7R1/js.jar #{file}")
        end
      end
      raise "JSSpec test failures" unless all_fine
    end
  end
end

# Uncomment this to add jsspec tests to your Cruise Control task
# [:test, :cruise].each do |taskname|
#   task taskname do
#     exceptions = ["test:jsspec"].collect do |task|
#       puts "Beginning JSSpec test suite..."
#       begin
#         Rake::Task[task].invoke
#         nil
#       rescue => e
#         e
#       end
#     end.compact
#   
#     exceptions.each {|e| puts e }
#     raise "Test failures" unless exceptions.empty?
#   end
# end