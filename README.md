To clone this repo use the `--recursive` option, so all submodules are
downloaded as well:

	$ git clone --recursive https://github.com/rodarima/benchmark

To add a new programming model (say pm3), first create a branch in the app repo
(app1.git) which performs the benchmark when `make bench.txt` is called. Then to
add the branch here use:

	$ git submodule add -b pm3 ../app1.git apps/app1/pm3

Notice the relative path ../app1.git is relative to the remote of this
repository.

To update all submodules and point all branch to their remote branches do the
following:

	$ git submodule update --recursive --remote

Note: GitHub doesn't link relative paths in the web view to the appropriate
repository. The full path works fine.
