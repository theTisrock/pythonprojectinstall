
# <u>Python Installer</u> for MacOS & Linux

#### A complete Python project environment in seconds
author: <a href="https://www.linkedin.com/in/chris-torok/">Chris Torok</a>

Get your project up and running now!

### Features & Benefits

- Isolates your Python project, a Python best practice.
- Automatic Virtual Environment activation
- Less time for setup, more time for development


### Requires

- Install `gcc`,`make` & `brew`
- Give execution privileges to the install script `chmod +x install.sh`


### Use
#### Install

install commands:

First, make a `bin` in your home directory: `mkdir "${HOME}/bin"` 

```bash
curl --output "${HOME}/bin" "https://raw.githubusercontent.com/theTisrock/pythonprojectinstall/refs/heads/master/pyinstall" && chmod +x "${HOME}/bin/pyinstall"
```

Lastly, configure `~/.bashrc` or `~/.zshrc` by adding:

`PATH="${HOME}/bin:${PATH}` 


#### Local Install!

In your favorite terminal application...
1. Copy the install script or clone this directory into your project: `cp pythonprojectinstall/install.sh myproject`
2. Make the install script executable: `chmod +x myproject/install.sh`
3. Make sure your project's `requirements.txt` are present under your project's root directory: `myproject/requirements.txt`
4. Run the installation and provide your desired Python version: `./install.sh 3.12.0`

### Congrats!

Each time you change into your project directory, your Python interpreter and dependency environment is activated automatically.


### Tear Down

- List your pyenv environments with `pyenv versions` to see what is installed on your system.
- Remove with `pyenv uninstall <pyenv-virtualenv environment>`, eg `pyenv uninstall myproject_py3.12.0`


### Links

- Install brew by pasting this into your terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Brew site: https://brew.sh/ (called 'Homebrew')
