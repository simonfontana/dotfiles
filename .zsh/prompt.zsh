## Configuration for spaceship-prompt
# All options available at https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md

# Load
autoload -U promptinit; promptinit
prompt spaceship

# Prompt
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

# List of disabled features (SHOW=false)
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_GIT_SHOW=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_GRADLE_JVM_SHOW=false
SPACESHIP_GRADLE_SHOW=false
SPACESHIP_HASKELL_SHOW=false
SPACESHIP_HOST_SHOW=false
SPACESHIP_HG_SHOW=false
SPACESHIP_HG_BRANCH_SHOW=false
SPACESHIP_HG_STATUS_SHOW=false
SPACESHIP_JOBS_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_KUBECTL_SHOW=false
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_MAVEN_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TIME_SHOW=false
SPACESHIP_USER_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_XCODE_SHOW_LOCAL=false
