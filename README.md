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


### New version of an app

Now consider that you updated some app, and you want to include the new changes
into the benchmark.

The benchmark freezes the current tip of each branch at the moment of the
commit. So any changes in the app branches are not reflected in the benchmark
yet. This is interesting as we want for any benchmark release version to always
work with the same version of the apps, regarding future improvements.

In order to update all benchmark apps, run:

	$ git submodule update --recursive --remote
	Submodule path 'apps/app1/pm1': checked out 'daec729b2b495a860d5ef677eb7cfca11dabc19e'

In this case the `apps/app1/pm1` was modified. You will see changes as if the
submodule folders were modified files:

	$ git status
	On branch master
	Your branch is up to date with 'origin/master'.

	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git restore <file>..." to discard changes in working directory)
		modified:   apps/app1/pm1 (new commits)

	no changes added to commit (use "git add" and/or "git commit -a")

Then use the `git add apps/app1/pm1` and `git commit` commands to create a new
benchmark commit to include the new versions or your apps.

### New programming model

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
