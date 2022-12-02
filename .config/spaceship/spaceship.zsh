# Already enabled
# spaceship add battery        # Battery level and status
# spaceship add char           # Prompt character
# spaceship add dir            # Current directory section
# spaceship add exec_time      # Execution time
# spaceship add exit_code      # Exit code section
# spaceship add jobs           # Background jobs indicator
# spaceship add venv           # virtualenv section

# No new line before prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

# Battery - only show when below threshold
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=10

# Directory
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true

# Execution time - only show when command takes longer than time elapsed
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=2

# Show python venv
SPACESHIP_VENV_SHOW=true

# Show exit code
SPACESHIP_EXIT_CODE_SHOW=true

# Everything is loaded by default. Remove what I don't want.
spaceship remove ansible        # Ansible section
spaceship remove async          # Async jobs indicator
spaceship remove aws            # Amazon Web Services section
spaceship remove bun            # Bun section
spaceship remove conda          # conda virtualenv section
spaceship remove crystal        # Crystal section
spaceship remove dart           # Dart section
spaceship remove deno           # Deno section
spaceship remove docker         # Docker section
spaceship remove docker_compose # Docker section
spaceship remove dotnet         # .NET section
spaceship remove elixir         # Elixir section
spaceship remove elm            # Elm section
spaceship remove erlang         # Erlang section
spaceship remove gcloud         # Google Cloud Platform section
spaceship remove git            # Git section (git_branch + git_status)
spaceship remove gnu_screen     # GNU Screen section
spaceship remove golang         # Go section
spaceship remove haskell        # Haskell Stack section
spaceship remove hg             # Mercurial section (hg_branch  + hg_status)
spaceship remove host           # Hostname section
spaceship remove ibmcloud       # IBM Cloud section
spaceship remove java           # Java section
spaceship remove julia          # Julia section
spaceship remove kotlin         # Kotlin section
spaceship remove kubectl        # Kubectl context section
spaceship remove line_sep       # Line break
spaceship remove lua            # Lua section
spaceship remove nix_shell      # Nix shell
spaceship remove node           # Node.js section
spaceship remove ocaml          # OCaml section
spaceship remove package        # Package version
spaceship remove perl           # Perl section
spaceship remove php            # PHP section
spaceship remove pulumi         # Pulumi stack section
spaceship remove purescript     # PureScript section
spaceship remove python         # Python section
spaceship remove ruby           # Ruby section
spaceship remove rust           # Rust section
spaceship remove scala          # Scala section
spaceship remove sudo           # Sudo indicator
spaceship remove swift          # Swift section
spaceship remove terraform      # Terraform workspace section
spaceship remove time           # Time stamps section
spaceship remove user           # Username section
spaceship remove vlang          # V section
spaceship remove xcode          # Xcode section
spaceship remove zig            # Zig section
