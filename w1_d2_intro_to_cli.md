Intro to CLI
============

##Opening

> <cite>"In the beginning was... the command prompt"</cite>
<br>

![image](unix_chart.jpg)

#### What is a GUI (pronounced gooey)?

GUI stands for: 

- **G**raphical 
- **U**ser 
- **I**nterface

Before we had a Graphical User interface (GUI) all we had on a computer was displayed using a the CLI.

CLI stands for:

- **C**ommand 
- **L**ine 
- **I**nterface

We going to develop a lot in the command line, we will use it every day on this course. It will greatly speed up our development process and it will make us feel like hackers!

#### What is the shell?

The shell is a user interface for access to an operating system's services. It is just a program that accepts commands as text input and converts them to appropriate operating system functions. 

It is the doorway into our computer's underbelly...

- Reference to Matrix
- [Type like a hacker](http://hackertyper.com/)

#### Z Shell

WDI London uses Z Shell, (ZSH) which is a shell designed for interactive use.

<br>

## We Do:  Opening & Closing the Command Prompt

#### Opening terminal

First, we need to launch the command prompt. We do this by using spotlight: 

```
cmd+space + "terminal"
```

and typing ```terminal``` followed by ```enter```.

#### Where is this program?

The program is located in 

```
/Applications/Utilities/Terminal.app
```

#### Closing terminal

(Open two tabs)

To exit the command prompt, you can use ```exit``` or ```cmd+d```.

You can also quit and force quit the application. 

You might not need to completely shut down the console but you might want to terminate a running process because it might be in a loop.

<br>

## I Do: Navigating through the command prompt

```
cd ~/
```

We're "looking into" the User directory at this point...

Use the **TAB** and **arrow keys** in the command line to increase your speed while navigating the command line.

```
cd + tab + arrow keys
```

If you don't press enter, just press delete to remove characters...

Pressing **UP** will also get the last command written.

<br>

## We Do: Common Unix commands

```
cd <directory name>
```

cd means Change Directory.  This will move us into our specified directory. We can normally leave out cd in zsh.

```
cd 
```
  
Without a specified directory this will take us to our home directory, the same as ```cd ~```

**Using zsh you don't need to use cd. It is a good habit to get into though.**

```
~
```

The tilda character will take you back to your User directory. 

You will need a cd for navigating using one dot. 

```
.
  
# Will need to do cd .
```

Is a pointer to the current directory, however using zsh you can't do just ```.``` or you will get an error ```.: not enough arguments```

``` 
..
```

Is a pointer to the parent directory

```
pwd
``` 
  
Present working directory

```
ls
```

List of items in current directory

```
ls -a
```
  
Will list all items in the current directory including hidden files.

```
ls -l
```
  
Will give you a long list of item in the current directory including permissions, size and last modified date.

```
history
```

Will list your entire commands history (use `!line_number` to retrieve a specific command)

```
grep
  
# history | grep <search item>
  
history | grep cd
```
  
Global regular expression parser - can be used with history to search. 

**Navigate to Desktop**

```
mkdir <directory name>
```
  
Will create the specified directory.

```
df -h
```
  
Display free disk space

```
mkdir <nameofdirectory>
```

Makes a new directory.

```
cd <nameofdirectory>
touch <filename>
```
  
Will create the specified file.

```
mv <filename> <filename2>
```

Is used for both moving files and renaming them.

```
cp <file to be copied> <name to copy it to>
```
  
Will copy first file to the name of the second file if specified

#### Careful here...

and renaming them, e.g

```
rm <filename>
```

Removes the specified file

```
rm -rf <directory name>
```

Removes the specified directory (Use with caution, make sure you are in the right place. "-rf" stands for recursive forced, and you can imagine how bad the results could be if you did that in your home folder!)

<br>

##We Do: 

####Directions to students:

Navigate to the desktop.

```
mkdir films 
```

to make a directory

```
cd films
```

to go into that directory

```
ls
```

to see where you are (directory is empty, nothing there)

```
touch casablanca
```

to make a file

```
subl casablanca
```

to open that file in sublime. Add some text and then close Sublime.

```
touch jaws titanic twilight
```

to make more movies!

```
mv jaws jaws2
```
  
to rename a file

```
subl .
```

to open the whole directory. Edit some files and then close Sublime, make sure everything is saved.

```
rm casablanca jaws
```
  
to remove a couple movies.

#### Aliases in zsh

You can also increase speed by using aliases which need to be added to the '.zshrc' file.

```
# Add in ~/.zshrc
```

<br>

##You Do: Keyboard shortcuts

Here are a list of keyboard shortcuts. You don't have to use them but if you remember them you will spend less time navigating the terminal and more time writing code.

[CLI Shortcuts](https://gist.github.com/alexpchin/01caa027b825d5f98871)

| **Keypress**    | **Action** |
|-----------------|-------------|
|Ctrl + A|  Go to the beginning of the line you are currently typing on
|Ctrl + E|  Go to the end of the line you are currently typing on
|Ctrl + L|  Clears the Screen, similar to the clear command
|Ctrl + U|  Clears the line before the cursor position. If you are at the end of the line, clears the entire line.
|Ctrl + H|  Same as backspace
|Ctrl + R|  Let’s you search through previously used commands
|Ctrl + C|  Kill whatever you are running
|Ctrl + D|  Exit the current shell
|Ctrl + Z|  Puts whatever you are running into a suspended background process. fg restores it.
|Ctrl + W|  Delete the word before the cursor
|Ctrl + K|  Clear the line after the cursor
|Ctrl + T|  Swap the last two characters before the cursor
|Tab    |   Auto-complete files and folder names

<br>