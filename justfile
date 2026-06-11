set dotenv-load

# Install python virtual environment
venv:
  [ -d .venv ] || python3 -m venv .venv
  ./.venv/bin/pip3 install -r tests/requirements.txt

# Run tests
test *args='':
  ./.venv/bin/python3 -m robot.run --outputdir output {{args}} tests

# Build linux package
build:
    ./ci/build.sh

# Build packages used in tests
build-test-packages:
    nfpm package -f tests/testdata/nfpm-example.yaml -p rpm --target tests/testdata
