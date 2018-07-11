
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

## GitKraken

* Is free for open-source and non-commerical use
* Installs in local appdata directory by default
* Does **not** use globally installed git, but instead is packaged with a custom version of Git.
* Bundles an SSH library, so nothing _needs_ to be configured outside the app. It does seem possible to 'use a local SSH agent' and have the keys managed externally.
* As of July 2018, no CVEs listed



Qs: 
* What configuration information is active when you go to the terminal? Are there any differences to when you are operating through GitKraken? Does it matter if you launch Git Bash from GK versus independently?

I tried opening two windows: one launched independently, and one launched from GK. When I changed the global user.email config in the indep one, it was also detected from the GK one.

* Does GK respect per-repo configuration information, or is this "part of the global git install" and therefore ignored?

Terminal launched from GK seems to act the same as an independently launched terminal. I suppose I didn't test whether auth was happening through windows credential store or GK, but in any case... it worked.


## Sourcetree

* Uses global installed Git or can install or use portable version
* Version 2.6.9 (current on 7-11-2018) requires .NET 4.7.1, which is part of the Windows Fall Creators update

* Can authorize as an oauth app with Github or operate without that

Steps I have tried:
- clone a repo from github/jalsalam: Success!
- use global/local config information created from CLI: Success!
- use cached authentication in Windows Credential store (non-integration mode): Success!
- in non-integration mode, sourcetree worked equally well for personal and work account personal repos.
- able to push to an organization account (in non-integration mode) using global git.


* Sourcetree respects local configuration with respect to the committer
* Once credential cacheing was set up correctly to work from the command line it also worked in Sourcetree (non-integration).


## Git Bash

https://tommaso.pavese.me/2014/07/08/git-config-for-multiple-github-accounts/

important setup:
git config --global user.name "Jameel Alsalam"
git config --global user.email "alsalam.jameel@epa.gov"

but in a jalsalam repo:
<within the repo>
git config --local user.name "Jameel Alsalam"
git config --local user.email "jalsalam@gmail.com"


## Git-GUI (included in Git for Windows)

Git-GUI is a basic GUI. It is not nearly as slick or user-friendly as other GUIs. Even though I am experienced with other GUIs, I had some trouble finding controls. For example, the icons to add individual files are unclear, and there aren't context menus to help out.

* uses the global Git and related authentication
* successfully pushed changes to github/USEPA org private repo using cached windows credential manager https authentication for Github.
* I did not see a place to check or modify user name and email information.
* You can view visualize the repo and browse commits, but it is located inconveniently which probably means people won't use it much.
* I did not see how to ignore individual files or folders

## Git Credential Manager

Git for Windows can cache username and password information for authentication to Github, Bitbucket, or other remote repo hosts. One of the options during installation of Git for Windows is whether or not to use it -- I recommend yes.

To check current configuration:
git config --global --list

and look for:
credential.helper=manager

to set it: (if it is not yet set)
git credential.helper manager

You can reach the Windows Credential Manager through Control Panel > All > Credential Manager. Git auth is under "General"

### Managing Multiple Github Accounts

EPA Github Guidance currently recommends maintaining separate Github accounts for work and personal repositories. However, managing multiple Github accounts can be complicated.

Git credential manager for Windows by default only stores credentials by url root. That means that if an https username/password is requested by Git, the credential manager really only has the capacity to store one.

One approach I am testing out, especially if you are just talking about a couple of repositories:
- Commit to just using the "work" Github account credentials for Github authentication
- Add the "work" account as a collaborator on the "personal" repo
This authentication is separate from who the commit is attributed to -- you can still use the --local user.email config to associate the commit with your personal account.

## Organization Accounts on Github

Many workplaces keep their code repositories in an organization account on Github. 


## Connecting to Bitbucket Serer w/ SSO proxy/SSH for Git



### Troubleshooting

When things are going well, you hardly know you are using the credential manager -- you might forget that usernames and passwords are involved at all.


### Line Endings

https://help.github.com/articles/dealing-with-line-endings/


