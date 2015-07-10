# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.4"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.1"
github "git",         "2.7.9"
github "go",          "2.1.0"
github "homebrew",    "1.12.0"
github "hub",         "1.4.1"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.5"
github "nodejs",      "4.0.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.4.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "vagrant",        "3.0.9"
github "osx",            "2.5.0"
github "iterm2",         "1.0.4"
github "alfred",         "1.1.8"
github "virtualbox",     "1.0.11"
github "flux",           "1.0.1"
github "onepassword",    "1.1.0"
github "dropbox",        "1.2.0"
github "shortcat",       "1.0.6"
github "dash",           "1.0.0"
github "chrome",         "1.1.2"
github "phpstorm",       "1.0.6"
github "sequel_pro",     "1.0.1"
github "mou",            "1.1"
github "spotify",        "1.0.1"
github "zsh",            "1.0.0"
github "gitx",           "1.2.0"
github "tmux",           "1.0.5", :repo => "kieran-bamforth/puppet-tmux"
github "sublime_text_2", "1.1.2"
github "slack",          "1.0.5"
github "php",            "1.2.8", :repo => "kieran-bamforth/puppet-php"
github "wget",           "1.0.1"
github "autoconf",       "1.0.0"
github "libtool",        "1.0.0"
github "pkgconfig",      "1.0.0"
github "pcre",           "1.0.0"
github "libpng",         "1.0.0"
github "mysql",          "1.2.0"
github "harvest",        "1.0.2"
github "skype",          "1.0.8"
github "python",         "2.0.1", :repo => "mloberg/puppet-python"
github "evernote",       "2.0.6", :repo => "jasonamyers/puppet-evernote"
github "induction",      "1.0.0"
github "firefox",        "1.2.1"
github "vagrant_manager","0.0.1"
github "vim",            "1.0.5"
github "elasticsearch", "2.8.0"
