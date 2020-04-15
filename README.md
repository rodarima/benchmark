## Benchmark demo

This repository contains a demonstration structure to perform benchmarks to
different apps, using multiple programming models (PM).

### Download

To clone this repo use the `--recursive` option, so all submodules are
downloaded as well:

	$ git clone --recursive https://github.com/rodarima/benchmark

You can see how the `apps/app1/*` folders get populated, each with a different
branch of the example app `app1`.

### Structure

Each app is expected to have one branch for each programming model of interest
for the benchmark. The structure of the apps folder is shown below, with one
folder for each app, and inside one subfolder for each programming model:

	apps
	├── app1
	│   ├── pm1
	│   └── pm2
	├── app2
	│   ├── pm1
	│   └── pm2
	...

Also, each app in a programming model benchmark branch like pm1 must accept a
command like `make bench.txt` which creates the file `bench.txt` with the
results of the benchmark. All apps and PMs are iterated, each one generating
its own `bench.txt` under the `apps/appX/pmY/bench.txt` path.

This repo provides a simple script that automates the process and concatenates
all benchmark results into `results.txt` file, with the app path prefixed for
each line. To run all benchmarks an generate the file use:

	$ make

Then take a look at the results:

	$ cat results.txt
	apps/app1/pm1 87
	apps/app1/pm2 60

### Update

To add a new programming model (say pm3), first create a branch in the app repo
(https://github.com/rodarima/app1.git) which performs the benchmark when `make
bench.txt` is called. Then to add the branch here use:

	$ git submodule add -b pm3 https://github.com/rodarima/app1.git apps/app1/pm3

To update all submodules and point all branch to their remote branches do the
following:

	$ git submodule update --recursive --remote

#### Relative paths

The relative path ../app1.git can also be used, relative to the remote of this
repository, but [GitHub doesn't link relative paths][1] in the web view to the
appropriate repository. The full path works fine. In Gitlab both relative and
full paths work fine in the web interface.

Notice that git can fetch the submodules with no problems in any case, is just a
bug in the GitHub web interface.

[1]: https://github.community/t5/How-to-use-Git-and-GitHub/Support-Linking-Relative-URL-s-on-submodules/td-p/24650
