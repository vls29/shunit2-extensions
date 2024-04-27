# shunit2-extensions

## How to use the Docker image

Mount the content of your repo(s) into /mnt, e.g. for this repo, you would run the following:

```shell
 docker run -v $(pwd):/mnt/shunit2-extensions shunit2-extensions
```

By default the entrypoint is setup to execute the test-runner script from shunit2-extensions/src/bash/ which will search for all tests in /mnt that end with `.test.sh` or `.tests.sh`
