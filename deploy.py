#run with fora

from fora.operations import system, git
from fora.host import current_host as host

system.package(["neovim", "ripgrep", "git"])

# pip.package(["pynvim"])

# clone complete repository to .config
home_directory = host.run(["sh", "-c", "echo", "$HOME"]).stdout
if home_directory == "\\":
    raise ValueError("Home on root not allowed")


git.repo(url = "https://github.com/PatrickDaG/nvim-config",
        path = f"{home_directory}/.config/nvim",
        depth = 1)
