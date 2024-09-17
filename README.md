
# <u>Python Installer</u> for MacOS & Linux

#### A complete Python project environment in seconds
author: <a href="https://www.linkedin.com/in/chris-torok/">Chris Torok</a>

Get your project up and running now!

### Features & Benefits
- Isolates your Python project
- Automatic Virtual Environment activation
- Less time for setup, more time for development


### Requires

- Install `gcc`,`make` & `brew`
- Give execution privileges to the install script `chmod +x install.sh`
- Add a few lines to your shell profile.


### Use

Quick install!
```shell
source <(curl -s https://raw.githubusercontent.com/theTisrock/pythonprojectinstall/master/install.sh) 3.12.0
```
Replace the last arg with whichever Python version you need.

In your favorite terminal application...
1. Copy the install script or clone this directory into your project: `cp pythonprojectinstall/install.sh myproject`
2. Make the install script executable: `chmod +x myproject/install.sh`
3. Make sure your project's `requirements.txt` are present under your project's root directory: `myproject/requirements.txt`
4. Run the installation and provide your desired Python version: `./install.sh 3.12.0`
5. Follow post installation instructions that appear when the script finishes. (you'll only have to do this once)

### Congrats!

Each time you change into your project directory, your Python interpreter and dependency environment is activated automatically.


### Tear Down

- List your pyenv environments with `pyenv versions` to see what is installed on your system.
- Remove with `pyenv uninstall <pyenv-virtualenv environment>`, eg `pyenv uninstall myproject_py3.12.0`


### Links

- Install brew by pasting this into your terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Brew site: https://brew.sh/ (called 'Homebrew')
