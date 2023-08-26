# Widget App

Sample application for testing deploys to render.com

## Dependencies

- docker
- ruby
- node
- overmind (replaces foreman)
  - `brew install overmind`
- direnv

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
