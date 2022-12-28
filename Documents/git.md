# Git Tutorial

## Introduction
Git is a version control system (VCS), in fact a distributed version
control system (DVCS) originally written by Linus Torvalds, the founder of
Linux.  Originally the Linux kernel was under the control of a DVCS named
Bitkeeper which would be no longer available to the developers of Linux. It
has become one of the most popular DVCS as it is very powerful and not too
difficult to learn, though there are myriads of commands/options to learn.
To get help

>       $ git help

or

>       $ git command --help

## Installation of Git

### Slackware
With a full installation of Slackware all git resources should be in place.
If not it can be installed from the installation media with 'installpkg'.
From the root of the Slackware
media cd into directory 'slackware64/d' and the issue command
>       $ installpkg git

>       $ installpkg new

### Arch Linux
Git is not installed by default on Arch so needs to be installed manually:-

>       $ sudo pacman -S git

## Verification
To verify the correct installation:

```bash
$ git --version
    Verifies that git is installed correcty and outputs the version number.
    Should output something like this:

$ git version 2.19.1
```


## Initialising and Creating a Git Repository
### Configuration and Help

Before using git, it has to be configured. It needs to know the user name
as well as the user's e-mail address. This can be done with the following
commands:

```bash
$ git config config --global user.name '<name>'
    Configure name of user.

```

```bash
$ git config --global user.email '<email address>'
    Configure the e-mail address of the user.
```

The configuration can be listed with:

>       $ git config --list

NOTE!

>    --system = system wide configuration in /etc/gitconfig\
>    --global = user config in ~/.gitconfig or ~/.configYgitYconfig\
>    --local  = specific to single repository I.e. .git/config

## Initialisation
Once git has been installed and configured in one of two ways:

```bash
$ git init
    Used when there are existing files in the directory.  This method creates a
    directory *.git* where all the repository files are located.
```

```bash
$ git clone URL [directory]
    Used for empty directories. This also creates a '.git' directory. You can
    either clone into an empty directory or into an empty named directory. The
    URL can be another directory to clone form or an internet URL
```


## Staging and Committing

```bash
$ git status
    Displays the status of the repository showing what files have been modified,
    staged or ready to be committed.
```

```bash
$ git add
    Modified files can be added to the staging area (index) with this command.
```

```bash
$ git commit
    Commits files in the staging area to the repository. Files in the working
    directory can also be committed if their file names are used as arguments
    and they are being tracked by git
```

## Git History

```bash
$ git log
    Displays various basic information about the repository.

$ git log --stat
    Displays extra information about file names an number of additions and deletions.

$ git log --oneline
    Displays history one line at a time.

$ git log --oneline --decorate --graph
    Same as --oneline option with extra info about branches.

$ git log -n
    Displays the last 'n' commits in the log.

$ git log commit-ref..commit-ref
    Displays range of commits.
```

## Remote Repositories

```bash
$ git remote
    With no arguments, shows a list of existing remotes.

$ git remote -v
    Be a little more verbose and show remote url after name.

$ git branch -a
    Displays all branches, remote and local.

$ git push
    Send commits to remote repository.

$ git pull
    Pull recent commits from remote repository. Also changes working
    directory.

$ git fetch
    Pull recent commits from remote repository but do not apply changes to working directory.

```

## Merge and Diff Tools

```bash
$ git diff
    Displays all modifications in current commit.
```


## Modifying and Deleting Commits

```bash
$ git amend

$ git revert

$ git reset --soft

$ git reset --mixed

$ git reset --hard

$ git revert

$ git cherry-pick

$ git clean -df

$ git clean -ndf
```

## Stashing Commits
```bash
$ git stash list [options]
    List the stash entries that you currently have. Each stash entry is listed
    with its name (e.g.  stash@{0} is the latest entry, stash@{1} is the one
    before, etc.), the name of the branch that was current when the entry was
    made, and a short description of the commit the entry was based on.

```

```bash
git stash show [<options>] [<stash>]
    Displays information about entries in the stash. If no options given
    displays only the files that have been stashed and the number of additions
    and or deletions.
    With the '-p' option the diffs are shown.
```
```bash
git stash drop [-q|--quiet] [<stash>]
    Remove a single stash entry from the list of stash entries. When no <stash>
    is given, it removes the latest one.  i.e.  stash@{0}, otherwise <stash>
    must be a valid stash log reference of the form stash@{<revision>}.
```
```bash
git stash branch <branchname> [<stash>]
    Creates and checks out a new branch named <branchname> starting from the
    commit at which the <stash> was originally created, applies the changes
    recorded in <stash> to the new working tree and index. If that succeeds,
    and <stash> is a reference of the form stash@{<revision>}, it then drops
    the <stash>. When no <stash> is given, applies the latest one.

    This is useful if the branch on which you ran git stash push has changed
    enough that git stash apply fails due to conflicts. Since the stash entry
    is applied on top of the commit that was HEAD at the time git stash was
    run, it restores the originally stashed state with no conflicts.

```
```bash
git stash [push [-p|--patch] [-k|--[no-]keep-index] [-q|--quiet]
            [-u|--include-untracked] [-a|--all] [-m|--message <message>]
            [--] [<pathspec>...]]

    Save your local modifications to a new stash entry and roll them back to
    HEAD (in the working tree and in the index). The <message> part is optional
    and gives the description along with the stashed state.

    For quickly making a snapshot, you can omit "push". In this mode, non-option
    arguments are not allowed to prevent a misspelled subcommand from making an
    unwanted stash entry. The two exceptions to this are stash -p which acts as
    alias for stash push -p and pathspecs, which are allowed after a double
    hyphen -- for disambiguation.

    When pathspec is given to git stash push, the new stash entry records the
    modified states only for the files that match the pathspec. The index
    entries and working tree files are then rolled back to the state in HEAD
    only for these files, too, leaving files that do not match the pathspec
    intact.
```

```bash
git stash clear
    Remove all the stash entries. Note that those entries will then be subject
    to pruning, and may be impossible to recover
```
```bash
pop [--index] [-q|--quiet] [<stash>]
    Remove a single stashed state from the stash list and apply it on top of
    the current working tree state, i.e., do the inverse operation of git stash
    push. The working directory must match the index.

    Applying the state can fail with conflicts; in this case, it is not removed
    from the stash list. You need to resolve the conflicts by hand and call git
    stash drop manually afterwards.

    If the --index option is used, then tries to reinstate not only the working
    tree’s changes, but also the index’s ones. However, this can fail, when you
    have conflicts (which are stored in the index, where you therefore can no
    longer apply the changes as they were originally).

    When no <stash> is given, stash@{0} is assumed, otherwise <stash> must be a
    reference of the form stash@{<revision>}.
```
```bash
apply [--index] [-q|--quiet] [<stash>]
   Like pop, but do not remove the state from the stash list. Unlike pop,
   <stash> may be any commit that looks like a commit created by stash push or
   stash create.
```

```bash
git stash create [<message>]
    Create a stash entry (which is a regular commit object) and return its object
    name, without storing it anywhere in the ref namespace. This is intended to be
    useful for scripts. It is probably not the command you want to use; see
    "push" above.
```

```bash
git stash store [-m|--message <message>] [-q|--quiet] <commit>
    Store a given stash created via git stash create (which is a dangling merge
    commit) in the stash ref, updating the stash reflog. This is intended to be
    useful for scripts. It is probably not the command you want to use; see
    "push" above.
```
