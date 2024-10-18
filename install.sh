# requires brew + gcc + make + (bash | zsh)

PYTHON_VERSION=$1
PROJECT_NAME=$(basename $(pwd))


echo "Installation implemented for MacOS+zsh and Linux+bash"
echo ""

echo "checking for required OS dependencies ..."
gcc --version
if [ $? -ne 0 ]
then
  echo "gcc must be installed to continue. Installation aborted."
  exit $?
fi
make --version
if [ $? -ne 0 ]
then
  echo "make must be installed to continue. Installation aborted."
  exit $?
fi
brew --version
if [ $? -ne 0 ]
then
  echo "brew must be installed to continue. Installation aborted."
  exit $?
fi
echo "...done checking for OS dependencies."
echo ""

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


echo "install & configure the python virtual environment for this project ..."
pyenv virtualenv "${PYTHON_VERSION}" "${PROJECT_NAME}_py${PYTHON_VERSION}"
pyenv versions
pyenv local "${PROJECT_NAME}_py${PYTHON_VERSION}"
echo "...done installing & configuring the python virtual environment for this project."
echo ""

EXPECTED_PYTHON_VERSION="Python ${PYTHON_VERSION}"
# echo "CHANGING PYTHON VERSION TO TEST VERSION MATCHING ENFORCEMENT"
# pyenv local 3.12.0
ACTUAL_PYTHON_VERSION=$(python --version)
echo "checking that the intended version of Python matches the actual version ..."
if [ "${EXPECTED_PYTHON_VERSION}" != "${ACTUAL_PYTHON_VERSION}" ]
then
  echo "Expected version: ${EXPECTED_PYTHON_VERSION}"
  echo "Actual version: ${ACTUAL_PYTHON_VERSION}"
  echo "Stopping installation."
  exit 1
fi
echo "Your chosen Python version installed successfully!"
echo "...done checking the correct version of Python."
echo ""


echo "getting latest pip ..."
pip install --upgrade pip
echo "...done getting latest pip"
echo ""

echo "testing the project python virtual environment ..."
pip install --no-cache-dir requests
python -c "import requests;"
if [ $? -ne 0 ]
then
  echo "Python failed to import the 'requests' dependency. This means that Python cannot see the packages associated with this project."
  echo ""
  echo "Make sure your PATH environment variable is configured in your shell profile."
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
  echo "Rerun the installation once you have configured your PATH."
  echo "Stopping installation."


  exit $?
fi
echo "Python dependency imported successfully!"
echo "Removing the test dependency"
pip uninstall requests -y
echo "...done testing project python virtual environment"
echo ""


echo "installing your requirements.txt ..."
pip install -r requirements.txt
echo "...done installing your requirements.txt"


echo ""
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
