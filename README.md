# Widget App

Sample application for testing deploys to render.com

## Dependencies

- docker
  - for development postgres and redis
- ruby
- node
- overmind (replaces foreman)
  - https://github.com/DarthSim/overmind
  - `brew install overmind`
- direnv
  - https://direnv.net/
  - `brew install direnv`

## Setup

```
bin/setup.sh
```

## Development

```
bin/dev.sh
open http://localhost:3030
open http://localhost:5173
```

### Debugging

- `overmind connect server`
  - this will open a tmux session on the rails server
- add `binding.break` in your ruby code and debug as usual in tmux session
- exit tmux with `ctrl+b` then `d`

## render.com deploys

relevant as of September, 2023

### Pricing and Tiers

Compute

- Free
  - web services spin down after 15 minutes of inactivity and automatically spin back up when a new web request comes in
  - workers do not qualify for free tier
  - PostgreSQL databases qualify for free but expire 90 days after creation
- Starter
  - minimum required to actually run an application
- Standard, Pro, Pro-plus, Custom
  - see https://render.com/pricing

PostgreSQL Pro and above offer PITR (Point-in-time Recovery)

Org Structure:

- Individual, Team, Organization, Enterprise
  - charge is per user, Individual is free and goes up from there

### Blueprint

Blueprints (infrastructure as code) allow you to define all of your resources in a yaml file in the root of your repo.

See [./render.yaml](./render.yaml) for example to provision resources for a robust rails app including PostgreSQL, Rails server, Sidekiq and Redis.

- https://render.com/docs/blueprint-spec
- https://render.com/docs/deploy-rails#use-renderyaml-to-deploy
- https://render.com/docs/deploy-rails-sidekiq#blueprints

Steps to deploy

- Create render.yaml file with all relevant information for your application
- Commit to repo and push to Github
- In the render.com dashboard navigate to 'Blueprints'
- Click 'New Blueprint instance'
- Connect to your repo
- render.com will automatically provision all of your resources and boot up your application

### Preview Apps

preview apps are special auto deployed versions of your application based on Github Pull Requests

render.com has two different types of preview apps:

- Build Previews
  - https://render.com/docs/pull-request-previews
  - unless you are building completely static sites, these seem useless for real world usages
  - an instance of your app is deployed with the changes from your PR, however it will use existing env and settings
  - this means it will most likely be connected to your main database which could be very bad if you have migrations in your PR
- Preview Environments
  - https://render.com/docs/preview-environments
  - Preview Environments are only available for 'Team' and above

Preview Environments are Crème de la crème for previewing changes to your application, each PR will use the blueprint to spin
up a brand new environment including fresh databases. It is completely isolated from your main (production) deployment and from other preview deployments.
Many settings can be overriden for preview apps including the tier of compute the servers run on as well as environment variables.

see [./render.yaml.previewsEnabled](./render.yaml.previewsEnabled)

> There is currently an issue with Preview Environments:

render.com allows you to define env in multiple ways, the simplest being in the render.yaml file, however you do not want secrets
to be defined here, instead you would use [`sync: false`](https://render.com/docs/configure-environment-variables#3-specifying-environment-variables-in-the-blueprints-spec)
in render.yaml and then enter those values into the render web UI.

This is problematic for Preview apps as you don't want to have to manually enter values for every PR.

Ideally you would be able to define both a production and staging 'env group' and then specify staging env group for preview apps.

Apparently it is on the roadmap, hopefully available soon. Links below discuss the issue further and have possible workarounds:

- https://feedback.render.com/features/p/enable-preview-environment-group-override
- https://community.render.com/t/preview-only-environment-group/1067
