https://youtu.be/1oY9ofjH2_o?si=xMFzPlkSeqHFyZdK

[![Click to Enlarge Process Flowchart](process-flow-chart-01-thumb-300px.png)]([https://github.com](http://startdesktop.com/files/graphicsprocess-flow-chart-01.png))


## **Current Features - StartDesktop Browser Control** 
### Test our Star tDesktop Browser Control: 
     http://me2pc.com/index.php/start-desktop-user-interface

### Test our Start Desktop - Powered by JavaScript: 
     http://bobbycooper.net 
     
## Start Desktop User Interface

### -Search for any button

### -Export / Import Changes made to buttons to xml file - downloaded.

### -10 tabs containing 10 buttons each (100 total buttons)

### -Bulk Edit: Modify button names in bulk, up to 100

### -Inline Edit "Pencil" of button link

### -Drag & Drop moving of buttons on same page

### -Switch from Light to Dark theme
# StartDesktop Process

Video on youtube: https://youtu.be/0cKoVyqZNIc?si=SaL95AqwEb2G3bzj

### Execute commands, launch programs and open websites from browser on any X-Windows desktop.

### You can also use our StartDesktop Process to turn a html webpage(s) into Graphical User interface "GUI" for any bash powered program. And so much more. Now, creating a custom GUI is much easier than ever before using our new Linking and Browser Command Execution process.

**The complete StartDesktop process is very easy to implement, customize and to use.**

**The StartDesktop process consists of 2 separate parts**

   ~~A. X-Windows x-scheme-handlers registrasion of "linuxapps" <--linuxapps:// (just once)~~ .

   A. A single html / css / Client Side JavaScirpt Webpage 
      (with our special malformed hybrid prefix-hyperlink urls) 
       <a href="linuxapps://launch?app=vlc">Launch VLC</a>) "vlc" -->

   ~~C. Desktop Launcher "linuxApps.deskop"~~
       ~~- Exec=/home/linux/linuxApp.sh %u~~
       ~~- MimeType=x-scheme-handler/linuxapps;) %u="vlc" -->~~
       
   B. 100% bash listener socat webserver shell script.

   ~~C. Shell Script  "linuxApps.sh"~~
       ~~- %u="vlc" --> linuxApps.sh --> vlc program is launched.~~ 
       
###**what can be dropped in to a button and then executed with a single click**

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 COMPLEX COMMAND EXAMPLES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Multiple apt commands with chaining:
   http://192.168.207.133:9000/launch/sudo_"sudo apt-get update && sudo apt-get upgrade -y"

2. GUI dialog + system commands:
   http://192.168.207.133:9000/launch/bash_"yad --question --text='Proceed?'; sudo apt-get update; xdg-open 'https://deepseek.com'"

3. Complex scripting with variables:
   http://192.168.207.133:9000/launch/bash_"for i in {1..5}; do echo \"Count: $i\"; sleep 1; done"

4. Multi-line commands with semicolons:
   http://192.168.207.133:9000/launch/bash_"cd /tmp; mkdir test; touch test/file.txt; ls -la test/"

5. Conditional execution:
   http://192.168.207.133:9000/launch/bash_"which firefox && firefox || echo 'Firefox not installed'"

6. Background processes:
   http://192.168.207.133:9000/launch/bash_"nautilus &; gnome-calculator &"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 SYNTAX RULES:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

• Use double quotes around the entire command: prefix_"your command here"
• Multiple commands: separate with ; or && or ||
• Escape inner double quotes with backslash: \"
• Query parameters (?_cb=xxx) are automatically stripped

🔧 PREFIXES:
  bash_  - Opens terminal window, runs commands (no sudo)
  sudo_  - Prompts for password, runs with elevated privileges
  (none) - Runs silently in background

✨ Features: yad dialogs, command chaining, variables, conditionals, loops
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

### **Linux Webtop Installer script will:** 

- Extract system username and insert it in to Desktop Launcher and creates "linuxApp.desktop" file.

- Configure x-sheme-handlers associating linuxapps to the linuxApp.desktop Desktop Launcher.

- Copies Desktop Launcher "linuxApp.desktop" to required system directories and to your Desktop.
- Makes all Desktop Launchers executable.

- Updates mime database and registers protocal "linuxapps:// in x-scheme-handles system.

- Copies Dispatcher File "linuxApp.sh" to ~/linuxApp.sh"

- Tests to see if x-scheme-handlers associaton and update was successful and reports status

- Provides test code you can use to see StartDesktop is functioning properly.


### **The StarDesktop Process:**
**1. Register Custom url linuxapps:// in X-Windows x-scheme-handlers and associate it to "linuxapps"**

- Using the standard X-Windows built-in x-scheme-handlers registraton process we associate "linuxapps" to a single Desktop Laucher "linuxApps.desktop". x-scheme-handlers are used by the X-Windows system to properly handle traditional url links like: http / https / ftp and our custom url link: linuxapps:// . 


**2. Create the custom Desktop Launcher, copy to system directories and make them all executable.


**3. Copy Dispatcher File "linuxApp.sh" to your home directory "~/linuxApp.sh"


**4. Provides base example html webpage "linuxApps.html" with examples of our custom url links:** 

- linuxApps.html will be located in the directory where you extracted the zip file: or 
  in the default directory: ~/linuxApps/linuxApps.html

- Use our custom linuxapps hyperlinks like this: - <a href="linuxapps://launch?app=vlc">Launch VLC</a>

==================================
Example code (but it will vary on your own personal needs):

## **Desktop Launcher - linuxApp.desktop**

[Desktop Entry]

Version=1.0

Type=Application

Name=LinuxApps

Comment=Universal local apps launcher (linuxapps:// protocol - supports multiple Linux apps)

Exec=/home/linux/linuxApp.sh %U

Icon=application-x-executable

Terminal=false

Categories=Utility;

MimeType=x-scheme-handler/linuxapps;

NoDisplay=false

==================================
## **Dispatcher File - linuxApp.sh**

\#!/bin/bash
\# ~/linuxApp.sh - Universal linuxapps:// handler (Debian-friendly)

URL="$1"

\# Log for debugging
echo "$(date): Received: $URL" >> /tmp/linuxapps.log

\# Extract the 'app' parameter reliably (handles ? and &)
APP=$(echo "$URL" | sed -E 's/.*[?&]app=([^&?#]*).*/\1/')

if [ -z "$APP" ]; then
    notify-send "LinuxApps Error" "No app parameter found!\nURL: $URL"
    echo "ERROR: No app= parameter in $URL" >&2
    exit 1
fi

case "$APP" in

   vlc)
        exec vlc ;; 
        
    browserIDE)
        exec /production/browser-ide/launchBrowserIDE.sh ;;
        
    yadEditor)
        exec /production/browser-ide/yadEditorWindow.sh ;;
    
     gimp)
        exec gimp ;;
        
terminal|konsole|xterm|gnome-terminal|lxterminal)

        exec x-terminal-emulator ;;   # works on most Debian setups
        
    *)
        notify-send "LinuxApps" "Unknown app: $APP"
        
        echo "Unknown app requested: $APP" >&2
        
        exit 1
        
        ;;
        
esac

==================================

html file: linuxApps.html:

<html>
   
<body>

    <a href="linuxapps://launch?app=vlc" class="launch-btn">Launch VLC</a>
    
    <a href="linuxapps://launch?app=broswerIDE" class="launch-btn">Launch VLC</a>
    
    <a href="linuxapps://launch?app=yadeditor" class="launch-btn">Launch VLC</a>
   
    <a href="linuxapps://launch?app=gimp" class="launch-btn">Launch VLC</a>
    
</body>

</html>

===================================

Video on youtube: https://youtu.be/0cKoVyqZNIc?si=SaL95AqwEb2G3bzj
