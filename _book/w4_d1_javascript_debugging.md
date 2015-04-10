Debugging in JS
=====

## Opening: Debugging in JS

As the complexity of JavaScript applications increase, developers need powerful debugging tools to help quickly discover the cause of an issue and fix it efficiently.

The **Chrome DevTools** include a number of useful tools to help make debugging JavaScript less painful.

<br>

## We Do: Debug a JS File

Send across the code and load with Chrome.

#### The Sources Panel

The Sources panel lets you debug your JavaScript code. It provides a graphical interface to the V8 debugger. Follow the steps below to explore the Sources panel:

- Open the site.
- Open the DevTools window.

```
cmd+alt+j
```

- If it is not already selected, select **Sources**.

Take a look:

![image](chrome.jpg)

<br>

### Debugging with breakpoints

[i]: Like pry in JS

A breakpoint is an intentional stopping or pausing place in a script. Use breakpoints in DevTools to debug JavaScript code, DOM updates, and network calls.

#### Add and remove breakpoint

Click the line gutter to set a breakpoint for that line of code. A blue tag will indicate if a breakpoint has been set.

**Multiple breakpoints**

You can add multiple breakpoints. Click the line gutter of another line to set another breakpoint. All the breakpoints you have set appear under Breakpoints in the right-hand sidebar.

Breakpoints can be enabled or disabled using the checkboxes in this sidebar. If a breakpoint is disabled, the blue tag will appear faded out.

Click on a breakpoint entry to jump to that particular line in the source file:

Remove a breakpoint by clicking the blue tag breakpoint indicator.

Right-click on the blue tag to access a menu with several options including: 

- Continue to Here
- Remove Breakpoint
- Edit Breakpoint
- Disable Breakpoint

<br>

### Conditional breakpoint

To set a conditional breakpoint, choose Edit Breakpoint. Alternatively, right-click on the gutter line and choose Add Conditional Breakpoint.

In the input field, type any expression that could resolve to true or false. The breakpoint will pause code execution only if the condition is true.

```
count == 1
```

Above:

```
alert("hi");
```

<br>

### Debugger keyword

It may not be desirable to set breakpoints from the DevTools interface. Should you wish to launch the [debugger](https://developer.chrome.com/devtools/docs/console.md#setting-breakpoints-in-javascript) from your code, you may use the debugger keyword to achieve this.

```
debugger

setTimeout(function(){ 
  alert("Loaded"); 
}, 0);
```

<br>

### Console drawer

[i]: Ensure a breakpoint is above alert

The DevTools console drawer will allow you to experiment within the scope of where the debugger is currently paused. Hit the **Esc** key to bring the console into view. The Esc key also closes this drawer.

Check the value of ```count```:

```
> count
< 0
```

<br>

### Execution control

[i]: Ensure that several breakpoints have been created

The execution control buttons are located at the top of the side panels and allow you to step through code. The buttons available are:

- **Continue**: continues code execution until we encounter another breakpoint.
- **Step over**: step through code line-by-line to get insights into how each line affects the variables being updated. Should your code call another function, the debugger won't jump into its code, instead stepping over so that the focus remains on the current function.
- **Step into**: like Step over, however clicking Step into at the function call will cause the debugger to move its execution to the first line in the functions definition.
- **Step out**: having stepped into a function, clicking this will cause the remainder of the function definition to be run and the debugger will move its execution to the parent function.
- **Toggle breakpoints**: toggles breakpoints on/off while leaving their enabled states intact.

There are also several related keyboard shortcuts available in the Sources panel:

| Execution | Shortcut |
|-----------|----------|
| Continue | `F8` or `Command + /` |
| Step over | `F10` or `Command+'` |
| Step into | `F11` or `Command+;`  |
| Step out | `Shift+F11` or `Shift+Command+;` |
| Next call frame | `Ctrl+.` |
| Previous call frame | `Ctrl+,` |

For a walkthrough of other keyboard shortcuts supported, see [Shortcuts](https://developer.chrome.com/devtools/docs/shortcuts).

<br>
### Interact with paused breakpoints

Once you have one or more breakpoints set, return to the browser window and interact with your page.

<br>
### Call Stack panel

The Call Stack panel displays the complete execution path that led to the point where code was paused, giving us insights into the code flaws that caused the error.

<br>
### Pretty Print

If you have trouble trying to read and debug minified JavaScript in the DevTools, a pretty printing option is available to make life easier. Here is how a minified script displayed in the tools might look prior to being displayed in the DevTools:

And by clicking on the curly brace  ("Pretty Print") icon in the bottom left corner, the JavaScript is transformed into a more human readable form. This is also more easy for debugging and setting breakpoints.

<br>
##Closure

Javascript debugging tools are improving... They still aren't perfect. However, it is important to understand the link between the JS V8 Engine and error reporting. 

<br>