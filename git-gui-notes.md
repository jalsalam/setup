
# Git GUIs
My notes on comparing and contrasting a few graphical user interfaces for Git.

The ideal Git GUI:
* Steers you towards good workflows even if you don't fully understand what is happening under the hood.
* Allows the more advanced workflows that are good
* Makes authentication not-too-difficult
* Is usable across a range of scenarios (work/home, open/closed, personal/org accounts, https/ssh/etc.)

## Candidates

The GUIs I am examining are:
* GitKraken
* Sourcetree
* Git-Bash (from Git for Windows)
* Git-GUI (from Git for Windows)
* Github Desktop

Alternative scenarios:
* Accessing repos on github/jalsalam
* Accessing repos on github/jameelalsalam
* Accessing repos on github/USEPA
* Accessing repos on EPA test bitbucket server

## Sourcetree

* Uses global installed Git or can install or use portable version
* Version 2.6.9 (current on 7-11-2018) requires .NET 4.7.1, which is part of the Windows Fall Creators update

* Can authorize as an oauth app with Github or operate without that

Steps I have tried:
- clone a repo from github/jalsalam: Success!


## Git Bash

https://tommaso.pavese.me/2014/07/08/git-config-for-multiple-github-accounts/

important setup:
git config --global user.name "Jameel Alsalam"
git config --global user.email "alsalam.jameel@epa.gov"

but in a jalsalam repo:
<within the repo>
git config --local user.name "Jameel Alsalam"
git config --local user.email "jalsalam@gmail.com"

## Git Credential Manager

Git for Windows can cache username and password information for authentication to Github, Bitbucket, or other remote repo hosts. One of the options during installation of Git for Windows is whether or not to use it -- I recommend yes.

To check current configuration:
git config --global --list

and look for:
credential.helper=manager

to set it: (if it is not yet set)
git credential.helper manager

### Managing Multiple Github Accounts

EPA Github Guidance currently recommends maintaining separate Github accounts for work and personal repositories. However, managing multiple Github accounts can be complicated.

Git credential manager for Windows by default only stores credentials by url root. That means that if an https username/password is requested by Git, the credential manager really only has the capacity to store one.

One approach I am testing out, especially if you are just talking about a couple of repositories:
- Commit to just using the "work" Github account credentials for Github authentication
- Add the "work" account as a collaborator on the "personal" repo
This authentication is separate from who the commit is attributed to -- you can still use the --local user.email config to associate the commit with your personal account.


### Troubleshooting

When things are going well, you hardly know you are using the credential manager -- you might forget that usernames and passwords are involved at all.


### Line Endings

https://help.github.com/articles/dealing-with-line-endings/


