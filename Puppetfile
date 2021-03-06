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

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.7"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.10.0"
github "go",          "2.1.0"
github "homebrew",    "2.0.2"
github "hub",         "1.4.3"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.7.0"
github "nodejs",      "5.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.4"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "alfred",         "1.5.0"
github "autoconf",       "1.0.0"
github "chrome",         "1.2.0"
github "docker",         "1.0.0"
github "dropbox",        "1.4.1"
github "elasticsearch",  "2.8.0"
github "evernote",       "2.0.6", :repo => "jasonamyers/puppet-evernote"
github "firefox",        "1.2.3"
github "flux",           "1.0.1"
github "gitx",           "1.2.0"
github "imagemagick",    "1.3.0"
github "iterm2",         "1.2.5"
github "imagemagick",    "1.3.0"
github "java",           "1.8.3"
github "libpng",         "1.0.0"
github "libtool",        "1.0.0"
github "macvim",         "1.0.0"
github "memcached",      "2.0.0"
github "mysql",          "2.1.2"
github "osx",            "2.8.0"
github "pcre",           "1.0.0"
github "php",            "1.2.9", :repo => "kieran-bamforth/puppet-php"
github "phpstorm",       "1.0.6"
github "pkgconfig",      "1.0.0"
github "python",         "2.0.1", :repo => "mloberg/puppet-python"
github "sequel_pro",     "1.0.1"
github "skype",          "1.1.0"
github "spotify",        "1.0.2"
github "sublime_text_3", "1.0.3",  :repo => "jozefizso/puppet-sublime_text_3"
github "tmux",           "1.0.2"
github "tunnelblick",    "1.0.7"
github "vagrant",        "3.3.1"
github "vagrant_manager","0.0.1"
github "vim",            "1.0.5"
github "virtualbox",     "1.0.13"
github "wget",           "1.0.1"
github "zsh",            "1.0.0"
