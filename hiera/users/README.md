# Per-user hiera configuration

The example `hiera.yaml` includes an entry in the hierarchy for
per-user configurations, allowing individuals to override many, many
common puppet parameters for their own machines.

Simply place a file in this directory named after your github
login. For example, if your github login is `johndoe`, you would edit
the file `johndoe.yaml` here.

# Private: Includes a user's personal configuration based on their GitHub username
#
# Usage:
#
#   include boxen::personal
#
# Parameters:
#
#   projects
#     Array of github projects to include
#   includes
#     Array of puppet modules to include
#   casks
#     Array of brew-casks to include (aliased as osx_apps)
#   homebrew_packages
#     Array of homebrew packages to install
#   custom_projects
#     Hash of custom project names and parameters

## Example

```yaml
boxen::personal::homebrew_packages:
  - pstree
  - htop

boxen::personal::osx_apps:
  - google-chrome
  - spotify
  - things

boxen::personal::projects:
  - project_a
  - secret_project
```

