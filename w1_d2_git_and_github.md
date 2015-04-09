Git & GitHub - Use GitHub to manage code and collaborate
=====

##Opening: GIT and GITHUB

Before version-control, every time we saved changes to the files/folders we worked on, they were overwritten. If two people were working on the same file LOCALLY (read: on their own machine) and pushed their own version of the modified file to the server, the person pushing its version last would overwrite their colleague's work & they would end up with a conflict. Git and Github allow you to avoid this situation.

[Github](http://byte.kde.org/~zrusin/git/git-cheat-sheet-medium.png) is a versioning system which will take a snapshot of your code as its stands currently. This allows you to rollback to previous versions, branch to make changes, which will not affect your current version and work collaboratively with other developers without conflicting with each others code. 

![git changes example](https://lh3.googleusercontent.com/CrdX41KocVA_-vgwGH07iU_8vIUKUTwmN5uypdgSfK8ksUpIHj0q6uLXZDHf7Ii8XQEDUqnDDefK4eAg3hcNmc4DLAcmiL9jl0UzKNVpQrujUUgiwd-PHyJE2Q)

As github versioning is distributed, users are able to have multiple copies of the code stored locally. When edited, changes will not be reflected on others local machines. 


<br>

##I Do: Introduction to git

### Git lifecycle

![git status lifecyle](https://lh6.googleusercontent.com/gVaIqKZb1lTccre7C7KXhMOB11RD8hcy9sJ-nrMEa419mwgKpp00z1pileUT9S_gmL6Ay65Wr2_RM8mfXVs8W0e18VtRhZoZQKjXVkRux8QtolqwIDinjii3Pg)

1. Add the file (git add)
2. Edit the file
3. Stage the file (git commit)
4. Commit: now that we've committed the change, the file is considered as "unmodified" (the current version is the updated, yet untouched version you were working on)
5. Remove the file

<br>
## We do: Creating your SSH Key

We did this during the Installfest.

1. `$ cd ~/.ssh` 
if it doesn't exist, `$ mkdir ~/.ssh` and go in that folder
2. ` $ ssh-keygen -t rsa -C "your_email"` (the email you registered to Github with)
3. Ignore the returned passphrase message, or set it to something simple and easily rememberable (e.g. your computer password). When typing it, nothing will show. That's normal.
4. `$ pbcopy < ~/.ssh/id_rsa.pub `- will copy your key to your clipboard
5. From here we can go into our github settings/ssh keys â†’  (top right)
6. Add ssh-key and name it
7. In the key text area | cmd + v |
8. Press return and then enter your password
9. Check that it works in terminal:
  * enter `$ ssh -T git@github.com`
  * enter password
  * Done - Github is now fully operational on your machine!

10. Let's now save your github username/email on your computer: 
  * `$ git config --global user.name "your github username"` will set your github username on your computer
  * `$ git config --global user.email "your github email"` will set your github email on your computer

<br>
## We do: First Repo and rollbacking

### Getting started with Git 

`$ git init ` will initialize a git repository in your current directory 

After making changes to your repository, you will need to tell git

`$ git add <file name>`  will add your changes for this file to the stage.

`$ git add .`   will add your changes from the whole directory to the stage.

`$ git status  ` will tell us what we currently have staged in the repo

`$ git commit -am "Initial commit" `  will make our first git commit. The "-am" part is a shortcut to add ALL the files at the same time and commit them. We change the message to reflect our changes.

`$ git commit -m "Accurate description of the changes we've made to the repo"  ` commits a snapshot of the current version of the file, with the appropriate description of the changes

`$ git rm  ` unstaging/removing file from git

**Special case: **  
If we end up in VIM!!!! type your commit message in the main body area. From here press esc, esc, esc, until we are off the main body area and then `:wq` (colon is a command, w stands for write, and q for quit). If we do not want to save our changes, we use esc, esc, esc, until we are off the main body area and then `:q!`

If we now repeat git status, we will see our changes are clean.

`$ git log`  will give us a history of our commits  (q to quit the git log) , including the commit IDs

`$ git remote -v  ` will return our remote versions
`$ git log --oneline ` will give us a simpler version of git log
`$ git config list ` will return  your settings
`$ git config --global user.name "your name" ` will set your name
`$ git config --global user.email "your email"`  will set your email


### Rolling back changes

**After staging:**

`$ git reset <filename>  ` will unstage files changes (HEAD refers to our last commit on current branch)

`$ git checkout <filename> `  will then remove these changes

**After committing:**
`$ git reset --soft <commit ID> ` will revert back after changes have been committed. --soft will keep these changes.
`$ git reset --hard <commit ID> ` will revert back after changes have been committed. --hard will destroy these changes.

### Creating a new Repo from GitHub

We can create a new repository in git by selecting the new git repo button on the top right of github.com â†’ look for this icon: (top right)

Once created, we can copy the SSH address provided on the repository landing page. 

![quick setup git](https://lh6.googleusercontent.com/U6fFQCNR5PBAoBe7eZPvGWnDhLdu704oeNNYlFq-7flRtW2v9B0uSI1wiN3Syn8lqDpKAiAnslwCNum03j39KOWhiO1ofhkK4FEjai1y8vLZ6oLpSecTRDnEJw)


We can now return to our terminal and create a the repository on our local machine
`$ git remote add origin <SSH address>`
`$ git push -u origin master  ` if we use -u, we are setting the upstream and will not need to enter origin(remote repo name) master(local branch name) next time we push to this directory. We can simply use  `$ git push`

If we now return to our github repository, all the files which we have just committed should be available in the remote repo.


<br>

##Assess

* How do I send changes to the staging area ?
* How do I check what is going to be committed ?
* How do I send the commits to github ?
* How do I go back to the previous commit 
* How do I check the configuration on a specific machine ?
* How does github know that I am allowed to push to a specific repo ?

<br>

##Closure

As a developer, you'll have to use git pretty much everyday, the learning curve is steep and all the principles of version control can  be a bit blurry sometimes, hence why we ask the students to push their homework everydayand to commit regularly during project time. Don't be frustrated by all the new commands, we will have the time to practice during WDI. 

<br>


