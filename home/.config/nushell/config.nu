use ($nu.default-config-dir | path join prompt.nu)
use ($nu.default-config-dir | path join mise.nu)
use ($nu.default-config-dir | path join hooks.nu)
source ($nu.default-config-dir | path join 	zoxide.nu)

hooks run-hooked 'print $"(ansi green_bold)Startup time:(ansi reset) ($nu.startup-time)"'
source $"($nu.home-path)/.cargo/env.nu"
