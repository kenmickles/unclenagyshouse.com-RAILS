# This is the source code for unclenagyshouse.com

It's a Rails app that [generates and deploys](https://github.com/kenmickles/unclenagyshouse.com/blob/master/lib/tasks/deploy.sh) a very simple static website.

I know what you're thinking! That's a lot of infrastructure for something that [Jekyll](http://github.com/mojombo/jekyll) can manage handily. But I'd argue that if you've already got a Rails environment set up, this is actually a really easy way to [bake a blog](http://inessential.com/2011/03/16/a_plea_for_baked_weblogs) with Coffeescript, SASS, etc.

(And, yeah, the unit tests are especially overkill, but I wanted to play with Travis CI.)

![](https://api.travis-ci.org/kenmickles/unclenagyshouse.com.png)

# License

The code in this repository is [MIT Licensed](http://en.wikipedia.org/wiki/MIT_License). Feel free to do whatever you want with it. The actual content (blog posts, images, videos, etc.) is licensed under the [Creative Commons Attribution-Share Alike 3.0 United States License](http://creativecommons.org/licenses/by-sa/3.0/us/).