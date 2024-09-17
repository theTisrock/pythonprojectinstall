# requires brew + gcc + make + (bash | zsh)

PYTHON_VERSION=$1
PROJECT_NAME=$(basename $(pwd))


echo "This setup script has been implemented for MacOS+zsh and Linux+bash"

echo "installing python build dependencies ..."
brew install openssl readline sqlite3 xz zlib tcl-tk
echo "...done installing python build dependencies."
echo ""


echo "installing python environment tools ..."
brew install -f pyenv pyenv-virtualenv
echo "...done installing python environment tools."
echo ""


echo "installing python version ${PYTHON_VERSION} ..."
pyenv install -s "${PYTHON_VERSION}"
echo "...done installing Python ${PYTHON_VERSION}"
echo ""


echo "install & configure the python virtual environment for this project ..."
pyenv virtualenv "${PYTHON_VERSION}" "${PROJECT_NAME}_py${PYTHON_VERSION}"
pyenv versions
pyenv local "${PROJECT_NAME}_py${PYTHON_VERSION}"
echo "...done installing & configuring the python virtual environment for this project."
echo ""


echo "confirming python version is installed into this project's virtual environment ..."
echo "results -> Expected version ${PYTHON_VERSION} == Actual version is $(python --version)"
echo ""


echo "getting latest pip ..."
pip install --upgrade pip
echo "...done getting latest pip"
echo ""

echo "testing the project python virtual environment ..."
echo "installing a sample dependency into our project virtual environment"
pip install tox
echo "verify dependencies are installed in our project virtual environment by displaying the tox version below"
tox --version
echo "removing the test dependency"
pip uninstall -y tox
echo "...done testing project python virtual environment"
echo ""


echo "installing your requirements.txt ..."
pip install -r requirements.txt
echo "...done installing your requirements.txt"


echo
echo "----- POST INSTALL INSTRUCTIONS -----"
echo 'zsh/MacOS shell users, add the following contents to your ~/.zshrc file:'
echo '
export PYENV_ROOT="${HOME}/.pyenv"
command -v pyenv >/dev/null || export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
'
echo ''
echo 'bash/Linux shell users, add the following contents to your ~/.bashrc file:'
echo '
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
'
echo ''

echo "* type 'exec \$SHELL' OR close and reopen this command prompt."
