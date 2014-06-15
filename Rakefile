desc "installs pathogen"
task :install_pathogen do
  puts "* installing pathogen"
  sh "curl https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > vim/autoload/pathogen.vim"
end

PLUGIN_TASKS = []
def pathogen_task(name, url)
  dir = "vim/bundle/#{name}"

  namespace(name) do
    desc "installs #{name} plugin"
    task :install do
      puts "* installing #{name}"

      sh "git clone #{url} #{dir}"
      FileUtils.rm_rf("#{dir}/.git")
    end
  end

  PLUGIN_TASKS << "#{name}:install"
end

namespace(:vwilight) do
  desc "installs vwilight colorscheme"
  task :install do
    puts "* installing vwilight"

    sh "curl https://raw.github.com/gist/796172/724c7ca237a7f6b8d857c4ac2991cfe5ffb18087/vwilight.vim > vim/colors/vwilight.vim"
  end

  PLUGIN_TASKS << "vwilight:install"
end

pathogen_task "ack.vim", "git://github.com/mileszs/ack.vim.git"
pathogen_task "align", "git://github.com/tsaleh/vim-align.git"
pathogen_task "color-sampler", "git://github.com/vim-scripts/Color-Sampler-Pack.git"
pathogen_task "commentary", "https://github.com/tpope/vim-commentary"
pathogen_task "ctrlp", "git://github.com/kien/ctrlp.vim.git"
pathogen_task "cucumber", "git://github.com/tpope/vim-cucumber.git"
pathogen_task "elixir", "git://github.com/elixir-lang/vim-elixir.git"
pathogen_task "endwise", "git://github.com/tpope/vim-endwise.git"
pathogen_task "eunuch", "git://github.com/tpope/vim-eunuch.git"
pathogen_task "fugitive", "git://github.com/tpope/vim-fugitive.git"
pathogen_task "gist-vim", "git://github.com/mattn/gist-vim.git"
pathogen_task "gitv", "git://github.com/gregsexton/gitv.git"
pathogen_task "git", "git://github.com/tpope/vim-git.git"
pathogen_task "go", "git://github.com/anzaika/go.vim.git"
pathogen_task "haml", "git://github.com/tpope/vim-haml.git"
pathogen_task "haskell", "git://github.com/vim-scripts/haskell.vim.git"
pathogen_task "irblack", "git://github.com/wgibbs/vim-irblack.git"
pathogen_task "javascript", "git://github.com/pangloss/vim-javascript.git"
pathogen_task "jellybeans", "git://github.com/nanotech/jellybeans.vim.git"
pathogen_task "markdown", "git://github.com/tpope/vim-markdown.git"
pathogen_task "puppet", "git://github.com/ajf/puppet-vim.git"
pathogen_task "rails", "git://github.com/tpope/vim-rails.git"
pathogen_task "ruby", "git://github.com/vim-ruby/vim-ruby.git"
pathogen_task "rust", "git://github.com/wting/rust.vim"
pathogen_task "searchfold", "git://github.com/vim-scripts/searchfold.vim.git"
pathogen_task "solarized", "git://github.com/altercation/vim-colors-solarized.git"
pathogen_task "supertab", "git://github.com/ervandew/supertab.git"
pathogen_task "surround", "git://github.com/tpope/vim-surround.git"
pathogen_task "syntastic", "git://github.com/scrooloose/syntastic.git"
pathogen_task "taglist", "git://github.com/vim-scripts/taglist.vim.git"
pathogen_task "textile", "git://github.com/timcharper/textile.vim.git"
pathogen_task "treetop", "git://github.com/nanki/treetop.vim.git"
pathogen_task "unimpaired", "git://github.com/tpope/vim-unimpaired.git"
pathogen_task "vim-airline", "git://github.com/bling/vim-airline.git"
pathogen_task "vim-coffee-script","git://github.com/kchmck/vim-coffee-script.git"
pathogen_task "vim-rspec","https://github.com/thoughtbot/vim-rspec.git"
pathogen_task "vividchalk", "git://github.com/tpope/vim-vividchalk.git"

desc "cleans the install"
task :clean do
  Dir["vim"].each {|d| FileUtils.rm_rf d }
end

desc "Set up vim folder"
task :vim_folder do
  FileUtils.mkdir("vim")
  FileUtils.mkdir("vim/autoload")
  FileUtils.mkdir("vim/bundle")
  FileUtils.mkdir("vim/colors")
  FileUtils.mkdir("vim/backup")
  FileUtils.mkdir("vim/macros")
end

desc "installs plugins"
task :install_plugins => PLUGIN_TASKS

desc "link vim files"
task :link do
  %w[ vimrc gvimrc vim ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end


desc "installs these dotfiles"
task :install => [:clean, :vim_folder, :install_pathogen, :install_plugins, :link]

task :default => :install
