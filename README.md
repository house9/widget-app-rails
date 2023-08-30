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

TODO: pricing, free tiers

TODO: preview apps/environments
