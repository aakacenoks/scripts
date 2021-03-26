repo_path = ARGV[0]
important_branches = %{master develop}

def get_branches
  branches = `git branch`.split("\n")
  branches.map { |branch| branch = branch.tr!('^a-zA-Z0-9-_', '') }
  branches
end

def run(path, important_branches)
  Dir.chdir(path) do
    puts "On folder: #{`pwd`}"
    get_branches.each do |branch|
      puts `git branch -D #{branch}` unless important_branches.include? branch
    end
  end
end

run(repo_path, important_branches)
