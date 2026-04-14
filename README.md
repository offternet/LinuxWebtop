https://youtu.be/1oY9ofjH2_o?si=xMFzPlkSeqHFyZdK

## **Current Features - StartDesktop Browswer Control** 
### Test our StartDesktop Browser Control: 
     http://me2pc.com](https://me2pc.com/index.php/start-desktop-user-interface)/

### **Test the Webtop Desktop here: http://offternet.atwebpages.com/**

### -Search for any button

### -Export / Import Changes made to buttons

### -10 tabs with 10 buttons (100 total buttons)

### -Bulk Edit: Modify button names in bulk, up to 100

### -Inline Edit "Pencil" of button link

### -Drag & Drop moving of buttons on same page

### -Switch from Light to Dark theme
# Linux Webtop Process

Video on youtube: https://youtu.be/0cKoVyqZNIc?si=SaL95AqwEb2G3bzj

### Execute commands, launch programs and open websites from browser on any X-Windows desktop.

### You can also use our Webtop Process to turn a html webpage(s) into Graphical User interface "GUI" for any bash powered program. And so much more. Now, creating a custom GUI is much easier than ever before using our new Linking and Browser Command Execution process.

**The complete Linux Webtop process is very easy to implement, customize and to use.**

**The Linux Webtop process envolves 4 separate parts**

   A. X-Windows x-scheme-handlers registrasion of "linuxapps" <--linuxapps:// (just once) .

   B. html Webpage(s) (with our special malformed hybrid hyperlink urls) 
       <a href="linuxapps://launch?app=vlc">Launch VLC</a>) "vlc" -->

   C. Desktop Launcher "linuxApps.deskop"
       - Exec=/home/linux/linuxApp.sh %u
       - MimeType=x-scheme-handler/linuxapps;) %u="vlc" -->

   D. Shell Script  "linuxApps.sh"
       - %u="vlc" --> linuxApps.sh --> vlc program is launched. 


### **Linux Webtop Installer script will:** 

- Extract system username and insert it in to Desktop Launcher and creates "linuxApp.desktop" file.

- Configure x-sheme-handlers associating linuxapps to the linuxApp.desktop Desktop Launcher.

- Copies Desktop Launcher "linuxApp.desktop" to required system directories and to your Desktop.
- Makes all Desktop Launchers executable.

- Updates mime database and registers protocal "linuxapps:// in x-scheme-handles system.

- Copies Dispatcher File "linuxApp.sh" to ~/linuxApp.sh"

- Tests to see if x-scheme-handlers associaton and update was successful and reports status

- Provides test code you can use to see Linux Webtop is functioning properly.


### **The Linux Webtop Process:**
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
