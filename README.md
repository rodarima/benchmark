To add a new programming model (say pm3), first create a branch in the app repo
(app1.git) which performs the benchmark when `make bench.txt` is called. Then to
add the branch here use:

	$ git submodule add -b pm3 <url of the app1.git> apps/app1/pm3

To pull all submodules and point all branch to their remote branches do the
following:

	$ git submodule update --recursive --remote
