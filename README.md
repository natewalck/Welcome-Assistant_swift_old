Welcome Assistant.app
=================

This is meant to be a customizable Welcome Assistant that could be used to welcome new users and guide them through some basic setup steps.

To configure the Welcome Assistant, modify the following plist:

```
/Library/Preferences/com.osxdevops.Welcome-Assistant.plist
```

The plist consists of two different arrays, one for the Welcome page (WelcomePage) and one for all other pages (AssistantPages). The WelcomePages array is unique and there can be only one of them with one page defined. You may have as many content pages of as many different types as you would like within the AssistantPages array.

Here are examples of each page type:


#####WelcomePage#####

```
    <key>WelcomePage</key>
    <array>
        <dict>
            <key>Title</key>
            <string>Welcome to Some Company!</string>
            <key>Body</key>
            <string>Some company tagline here</string>
            <key>Image</key>
            <string>/Library/CorpSupport/WelcomeAssistantAssets/companylogo.jpg</string>
        </dict>
    </array>
```


#####AssistantPages#####
Here is an example of one of each page type:

```

    <key>AssistantPages</key>
    <array>
        <dict>
            <key>PageType</key>
            <string>info</string>
            <key>Title</key>
            <string>Equipment Use Policy</string>
            <key>Content</key>
            <string>

For the rest of this document, because we are lazy, you ("the end user") will be described as "user", "you" or "hey you". You agree to not use this machine as a doorstop, door wedge or any other door stopping device. You agree to treat this machine as if it were one of your very own children and as such will not lock it in a hot car or leave it alone with strangers. If it gets messy from eating lunch, you will clean it up with non-harsh chemicals. Unlike a child, you shoud never give this machine a bath under any circumstance.

If liquids of any type are spilled upon this machine, you will immediately turn it off and unplug the power cable. No special emergency dance is required, removing power from the device promptly is necessary if you want it to survive the incident. If you must spill liquids on the machine reguarly, please be sure to spill non-sugary drinks (i.e. black coffee, diet soda, etc) as they are easier to clean up for the service technician.

This machine is given to you in good faith. If the machine is destroyed or otherwise made unusable before it is up for replacement, you may be issued a potato as a replacement. Please see the equipment use policy for potatoes in subsection 501.1p for more information on approved potato usage.


By clicking Continue, you agree to the above equipment use policy upon pain of death or great suffering.
</string>
        </dict>
        <dict>
            <key>PageType</key>
            <string>weburl</string>
            <key>Title</key>
            <string>Setup Google 2-Factor Authentication</string>
            <key>Content</key>
            <string>http://www.google.com/landing/2step/</string>
        </dict>
        <dict>
            <key>PageType</key>
            <string>image</string>
            <key>Title</key>
            <string>Here is a pretty picture!</string>
            <key>Content</key>
            <string>/Library/CorpSupport/WelcomeAssistantAssets/someimage.jpg</string>
        </dict>
    </array>
```