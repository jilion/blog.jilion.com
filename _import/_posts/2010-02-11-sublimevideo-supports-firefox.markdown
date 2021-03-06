--- 
wordpress_id: 252
layout: post
title: SublimeVideo supports Firefox
wordpress_url: http://blog.jilion.com/?p=252
---
We are working hard on the release of SublimeVideo (no date yet).

<img src="http://blog.medias.jilion.com/uploads/2010/02/firefox.png" alt="Firefox Icon" style="float:left;margin:0 24px 0 0;" /> We've just finished adding support for Firefox and <a href="http://en.wikipedia.org/wiki/Theora">Ogg Theora</a> videos. We figured we'd update the <a href="http://jilion.com/sublime/video">demo page</a> to show it to you.

It should work on Firefox 3.5, but we strongly encourage you to upgrade to the latest version (currently 3.6).

SublimeVideo on Firefox has pretty much all the basic features of the WebKit (Safari/Chrome) version, however there're some secondary features which couldn't be implemented because of Firefox limitations.

Here are the features that are currently <strong>missing</strong>:

1. Sleek Zoom-in/out transitions when entering/leaving full-window mode
2. Playback speed controls (when in full-window mode)
3. Other minor fade-in/out effects to highlight the poster frame and reveal the controls when mouse-hovering over the video

<img src="http://blog.medias.jilion.com/uploads/2010/02/SublimeVideo-full-window-controls-browsers-comparison.jpg" alt="SublimeVideo Full-Window Controls Browsers Comparison" /><em class="caption">SublimeVideo full-window controls browsers comparison</em>

We are confident that the <a href="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/">next release of Firefox</a> (3.7) will include all the necessary improvements that will allow us to implement the missing features.

A note regarding true <em>full-screen</em> mode:
At the moment we couldn't integrate this directly into our controls as we did for the WebKit Nightly build (by alt-clicking the full-window button), but if you're using Firefox 3.6 you can enter this mode by right-clicking on the video and choosing "Full Screen" from the contextual menu.

<a href="http://jilion.com/sublime/video">Enjoy</a>.
