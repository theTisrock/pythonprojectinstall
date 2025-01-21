
# <u>Python Installer</u> for MacOS & Linux

#### A complete Python project environment in seconds
author: <a href="https://www.linkedin.com/in/chris-torok/">Chris Torok</a>

Get your project up and running now!

### Features & Benefits

- Isolates your Python project, a Python best practice.
- Automatic Virtual Environment activation
- Less time for setup, more time for development


### Requires

- Dependencies `gcc`,`make` & `brew` must already be installed.


#### Download & Configure

First, make a `bin` in your home directory: `mkdir "${HOME}/bin"` 

```bash
curl --output "${HOME}/bin/pyinstall" "https://raw.githubusercontent.com/theTisrock/pythonprojectinstall/refs/heads/master/pyinstall" && chmod +x "${HOME}/bin/pyinstall"
```

Second, add the following text to your  `~/.bashrc` or `~/.zshrc` by typing 
```bash
echo 'PATH="${HOME}/bin:${PATH}"' >> ~/.bashrc
```

Lastly, refresh the shell by typing `exec $SHELL` or just close and reopen your shell.

Now you're ready to begin installing!



### Usage

#### Install your Python project environment

In your favorite terminal application...
1. Change into your project: `cd myproject`
2. Make sure your project's `requirements.txt` are present under your project's root directory: `myproject/requirements.txt` 
3. Run the installation: `pyinstall 3.12.0`

#### Common Operations

To install a different Python version, use the same command and change the version:
`pyinstall 3.13.1`

As long as all your dependencies are listed in `requirements.txt` they will be installed.

To update dependencies, just treat it like an normal Python environment. 
Simply add the dependencies to your `requirements.txt` and run `pip install -r requirements.txt`. 



### Congrats!

Each time you change into your project directory, your Python interpreter and dependency environment is activated automatically.


### Tear Down

- List your pyenv environments with `pyenv versions` to see what is installed on your system.
- Remove with `pyenv uninstall <pyenv-virtualenv environment>`, eg `pyenv uninstall myproject_py3.12.0`


### Links

- Install brew by pasting this into your terminal: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Brew site: https://brew.sh/ (called 'Homebrew')
