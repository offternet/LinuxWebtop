# Linux Webtop Process

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


**1. Register our Custom url linuxapps:// in X-Windows x-scheme-handlers:**

Using the standard X-Windows built-in x-scheme-handlers registraton process we associate "linuxapps" to a single Desktop Laucher "linuxApps.desktop". x-scheme-handlers are used by the X-Windows system to properly handle traditional url links like: http / https / ftp and our custom url link: linuxapps:// . 

**2. Create a webpage with our custom url links:** 

The custom linuxapps url hyperlink like this: - <a href="linuxapps://launch?app=vlc">Launch VLC</a>

**
