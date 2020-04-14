To add a new programming model (say pm3), first create a branch in the app repo
(app1.git) which performs the benchmark when `make bench.txt` is called. Then to
add the branch here use:

	$ git submodule add -b pm3 ../app1.git apps/app1/pm3

Notice the relative path ../app1.git is relative to the remote of this
repository.

To pull all submodules and point all branch to their remote branches do the
following:

	$ git submodule update --recursive --remote
