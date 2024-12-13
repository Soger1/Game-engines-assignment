# VR Theremin

Name: Ethan Holohan

Student Number: C20322553

Class Group: Year 4 Compsci

Video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

# Description of the project

My project was to try create a Theremin instrument in VR

# Instructions for use

Theremins are pretty simple to use but hard to master, you control the pitch by moving your left hand further or closer to the left pole and the volume by raising your right hand higher or lower

# How it works

the theremin works by using the godot audio stream generator to create a sine wave which is then output, the pitch range is limited to that of a theremin to try keep the sound similiar[1] (5 octaves roughly translates to the 65 - 2093 range used, all the audio generation and hand positioning is handled in the XR Origin scene, this is the scene where i kept all the vr elements in.

alot of the VR elements such as the hands and the pointer are taken from the XRtools kit that you can download for godot.

the pitch and vibrato can be adjusted using the two sliders next to the theremin, these sliders use the 3d2dviewport




# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

# References
[1] https://doctormix.com/blog/the-theremin-explained/
* Item 1
* Item 2

# What I am most proud of in the assignment

# What I learned

# Proposal submitted earlier can go here:

## This is how to markdown text:

This is *emphasis*

This is a bulleted list

- Item
- Item

This is a numbered list

1. Item
1. Item

This is a [hyperlink](http://bryanduggan.org)

# Headings
## Headings
#### Headings
##### Headings

This is code:

```Java
public void render()
{
	ui.noFill();
	ui.stroke(255);
	ui.rect(x, y, width, height);
	ui.textAlign(PApplet.CENTER, PApplet.CENTER);
	ui.text(text, x + width * 0.5f, y + height * 0.5f);
}
```

So is this without specifying the language:

```
public void render()
{
	ui.noFill();
	ui.stroke(255);
	ui.rect(x, y, width, height);
	ui.textAlign(PApplet.CENTER, PApplet.CENTER);
	ui.text(text, x + width * 0.5f, y + height * 0.5f);
}
```

This is an image using a relative URL:

![An image](images/p8.png)

This is an image using an absolute URL:

![A different image](https://bryanduggandotorg.files.wordpress.com/2019/02/infinite-forms-00045.png?w=595&h=&zoom=2)

This is a youtube video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

This is a table:

| Heading 1 | Heading 2 |
|-----------|-----------|
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |

