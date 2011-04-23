directory "vim"
directory "vim/autoload"
directory "vim/bundle"
directory "vim/colors"

desc "installs pathogen"
task :install_pathogen do
  puts "* installing pathogen"
  sh "curl #{PATHOGEN_URL} > vim/autoload/pathogen.vim"
end

plugin_tasks = []
def pathogen_task(name, url)
  dir = "vim/autoload/#{name}"

  namespace(name) do
    desc "installs #{name} plugin"
    task :install do
      puts "* installing #{name}"

      sh "git clone #{url} #{dir}"
    end
  end

  plugin_tasks << "#{name}:install"
end

namespace(:vwilight) do
  desc "installs vwilight colorscheme"
  task :install do
    puts "* installing vwilight"

    sh "curl https://gist.github.com/raw/796172/724c7ca237a7f6b8d857c4ac2991cfe5ffb18087/vwilight.vim > vim/colors/vwilight.vim"
  end
end

pathogen_task "ack.vim", "git://github.com/mileszs/ack.vim.git"
pathogen_task "color-sampler", "git://github.com/vim-scripts/Color-Sampler-Pack.git"
pathogen_task "fugitive", "git://github.com/tpope/vim-fugitive.git"
pathogen_task "git", "git://github.com/tpope/vim-git.git"
pathogen_task "haml", "git://github.com/tpope/vim-haml.git"
pathogen_task "javascript", "git://github.com/pangloss/vim-javascript.git"
pathogen_task "markdown_preview", "git://github.com/robgleeson/vim-markdown-preview.git"
pathogen_task "surround", "git://github.com/tpope/vim-surround.git"
pathogen_task "taglist", "git://github.com/vim-scripts/taglist.vim.git"
pathogen_task "supertab", "git://github.com/ervandew/supertab.git"
pathogen_task "cucumber", "git://github.com/tpope/vim-cucumber.git"
pathogen_task "textile", "git://github.com/timcharper/textile.vim.git"
pathogen_task "rails", "git://github.com/tpope/vim-rails.git"
pathogen_task "rspec", "git://github.com/taq/vim-rspec.git"
pathogen_task "snipmate", "git://github.com/msanders/snipmate.vim.git"
pathogen_task "markdown", "git://github.com/tpope/vim-markdown.git"
pathogen_task "align", "git://github.com/tsaleh/vim-align.git"
pathogen_task "unimpaired", "git://github.com/tpope/vim-unimpaired.git"
pathogen_task "searchfold", "git://github.com/vim-scripts/searchfold.vim.git"
pathogen_task "endwise", "git://github.com/tpope/vim-endwise.git"
pathogen_task "irblack", "git://github.com/wgibbs/vim-irblack.git"
pathogen_task "vim-coffee-script","git://github.com/kchmck/vim-coffee-script.git"
pathogen_task "syntastic", "git://github.com/scrooloose/syntastic.git"
pathogen_task "puppet", "git://github.com/ajf/puppet-vim.git"
pathogen_task "scala", "git://github.com/bdd/vim-scala.git"
pathogen_task "gist-vim", "git://github.com/mattn/gist-vim.git"
pathogen_task "vividchalk", "git://github.com/tpope/vim-vividchalk.git"
pathogen_task "solarized", "git://github.com/altercation/vim-colors-solarized.git"
pathogen_task "haskell", "git://github.com/vim-scripts/haskell.vim.git"
pathogen_task "ruby", "git://github.com/vim-ruby/vim-ruby.git"

desc "installs these dotfiles"
task :install => [:install_pathogen] + plugin_tasks
