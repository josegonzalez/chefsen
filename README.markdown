# chefsen

Because, thats why

# Requirements

- System ruby. Do not remove system ruby, consider it holy.
- Curl.
- Pristine System. Untested as to what will occur with existing systems.

# Installation

In a terminal

    # go to your home directory
    cd ~
    # download and extract the latest chefsen
    curl -L https://github.com/josegonzalez/chefsen/archive/master.tar.gz| tar zx
    # move chefsen into the proper location
    mv chefsen-master chefsen

# Usage

To start, we'll need to

This *should not* be destructive, but ymmv.

    cd chefsen
    # Install any chefsen dependencies
    ./script/bootstrap
    # Run chefsen
    ./script/chefsen

By default, `chefsen` will use a `mac.json` file within the `chefsen` directory. You can customize this to your fancy.

# Differences from boxen

- Built using chef recipes on top of chef-solo.
- Does not split up approved recipes into separate repositories. This may change, but is unlikely, as it makes installation not-so straightforward.
- Attempts to use homebrew packages where possible. While this may be a bit more error-prone, it also ensures we don't drift too far from the mainline, and that your upgrade attempts do not perform something wonky.

# TODO

- Attempt to install requirements such as XCode.
- Turn the chefsen dir into a repository tracking master
- If you specify the `-g GIST_ID`, then `chefsen` will retrieve the gist from github, save it as `mac.json`, and then run `chef-solo`. It will prompt if it were to overwrite an existing mac.json file.
- Chefsen will default to *quiet* mode when running `chef-solo`. This means that it uses `--force-logger` as it's logging mechanism. If you would like verbose, *why-run*, output, please add the `--no-quiet` flag to your chefsen run.
