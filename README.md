 TFA Star Wars Weapons Repository
 ======

Feel free to help improve these addons by making changes locally and sending in pull requests with finished work.  Your work is your own and this repository is only designed to make it easier on you, and everybody else, to fix bugs and improve the overall quality of this content. 

### Guidelines:
1. Your work is your own. It is okay to be protective of your own work and to make sure that it stays the way you want it to. 
2. Unless you have shown to be totally trustworth when it comes to your changes to this repository you will have to work off a pull request only access. This is to prevent people from breaking your own work as much as you breaking someone elses. 
3. Feel free to ask questions, discuss changes, and even use this repository as a reference point for people interested in your specific addon. A lot of people use this content and it makes sense for them to be able to know what we are working on. (to, at the very least, avoid having to answer their question every time they ask) 
4. It is 100% okay to use this repository as a way to have players create bug reports for your addon. In fact it's probably the best way to go about helping the players.
5. If necessary moving your addon to a seperate repository can be done. Just try to leave a link to the new location here in the readme. 


### Tutorials, Guides, Resources! 
If you are new to Git please do not be put off by the concept of an unfamiliar system. The use of git is quite simple and can extremely useful when working in a large group on a project like this.

The download for git bash can be found [here.](https://git-for-windows.github.io/) Make sure to fork the repository and set this one as your upstream. 

```lua
-- after downloading gitbash find a folder you are comfortable working from.
-- right click somewhere inside that folder and click "git bash here" 
-- type out the following commands to set up everything.
git clone "https://github.com/yourgithubname/tfa-sw-weapons-repository.git"
-- The above command can take a while to finish. 
-- Once finished go inside the new folder and git bash here again. 
git remote -v 
-- you should see the origin as your own personal repo. To add the live repo as your upstream do the next command.
git remote add upstream https://github.com/Servius/tfa-sw-weapons-repository.git 
-- Now you can do git pull upstream and youll get any updates that are accepted into the main repo. 

-- Once youve setup all the above you will want to be able to push your changes. Do the following:
git status
git add "*" 
git commit -m "What you did; Other thing you did" 
git push
-- Go to your own repository and click on merge requests -> create new merge request -> 
-- make sure you are aiming your own repo at the main repo 
-- Describe what you are changing and whats been done in the description and title. 
-- It will also list out your commits so don't worry about being super descriptive. 
```


 If you are having trouble getting started with git feel free to use any of the resources posted below: 

- Go to the following link to look through a tutorial I have setup: 
https://docs.google.com/document/d/1o599ftTRcHWWmDRIibNfC5NcJJF1YTY9IizqnxzgM7U/edit?usp=sharing

- You can also watch the video located here: 
https://www.youtube.com/watch?v=72a28tleThY&t=484s

## RULES OF USE
- It is completley not acceptable to claim any of the work posted here by someone else as your own work. 
- You may not re-upload other peoples work under any circumstances. 
If found violating any of the above a [DMCA])https://www.google.com/search?q=dmca&rlz=1C1CHBD_enUS728US728&oq=dmca&aqs=chrome..69i57.575j0j7&sourceid=chrome&ie=UTF-8) will be filed. 