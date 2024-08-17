
# <u>Python Installer</u> for MacOS

#### A complete Python project environment in seconds
author: <a href="https://www.linkedin.com/in/christopher-torok/">Chris Torok</a>

Get your project up and running now!

### Features & Benefits
- Isolates your Python project
- Automatic Virtual Environment activation
- Less time for setup, more time for development


### Requires

- A terminal, `brew` and `zsh`
- Add a few lines of text to the `~/.zshrc`
- Give execution privileges to the install script `chmod +x install.sh`


### Usage

In your favorite terminal application...
1. Copy the install script or clone this directory into your project: `cp pythonprojectinstall/install.sh myproject`
2. Make the install script executable: `chmod +x myproject/install.sh`
3. Make sure your project's `requirements.txt` are present under your project's root directory: `myproject/requirements.txt`
4. Run the installation and provide your desired Python version: `./install.sh 3.12.0`



Each time you change into your project directory, your Python interpreter and dependency environment is activated automatically.



