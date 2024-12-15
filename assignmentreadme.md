# VR Theremin

Name: Ethan Holohan

Student Number: C20322553

Class Group: Year 4 Compsci

Video:

[![YouTube]([https://www.youtube.com/watch?v=J2kHSSFA4NU])])

# Description of the project

My project was to try create a Theremin instrument in VR

# Instructions for use

Theremins are pretty simple to use but hard to master, you control the pitch by moving your left hand further or closer to the left pole and the volume by raising your right hand higher or lower

# How it works

the theremin works by using the godot audio stream generator to create a sine wave which is then output, the pitch range is limited to that of a theremin to try keep the sound similiar[1] (5 octaves roughly translates to the 65 - 2093 range used, all the audio generation and hand positioning is handled in the XR Origin scene, this is the scene where i kept all the vr elements in.

alot of the VR elements such as the hands and the pointer are taken from the XRtools kit that you can download for godot.

the pitch and vibrato can be adjusted using the two sliders next to the theremin, these are in the 3d2d viewport which uses the 2d ui to contain the sliders

the global varible is used to contain the values of the sliders and the current pitch, these are used to control the responsive lighting from the theremin.

the main scene contains all the static elements like the theremin model and the floor


# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| XR_Origin.gd | Modified from Claude.AI, [2], [3], [4]|
| sliderstore.gd | Modified from [3] |
| ui.gd | Modifided from [2], Claude.AI |
| main.gd | Modified from [4], Claude.AI |

# References
[1] https://doctormix.com/blog/the-theremin-explained/
[2] https://www.youtube.com/watch?v=lGZ2nAK-HiU&list=PLfX6C2dxVyLxXl3gJwakzdqRaV7WKlqFR&index=6
[3] https://www.youtube.com/watch?v=sc-tEPdLZhk
[4] https://www.youtube.com/watch?v=fxZoXfX4oBo&list=PLfX6C2dxVyLxXl3gJwakzdqRaV7WKlqFR&index=1


# What I am most proud of in the assignment

im happy that i managed to replicate a theremin to a good degree, and that it functions mostly as intended, however i couldnt get the think to sound like an actaul real theremin which sounds more like a violin or string instrument 

# What I learned

i learned alot about creating vr apps on godot and about modifiying sine waves and instruments 

# Proposal submitted earlier can go here:


