# Loom

**Loom** is a [jekyll](https://jekyllrb.com) theme that weaves HTML emails from markdown and [SCSS](https://sass-lang.com/). It also builds an archive ready for sharing on the web or over your favorite [punk-to-punk](https://en.wikipedia.org/wiki/Peer-to-peer_web_hosting) protocol. [Here's a demo](https://cscottmills.com/loom).

We'll assume you have some experience with terminal, markdown, HTML and SCSS, but if you don't, maybe this will be a good opportunity to dig in! Feel free to reach out via an issue on [the repo](https://gitlab.com/cscottmills/loom) if you'd like some help.

## To begin
Pour yourself a cool glass of water and put on some music. Maybe something like *[Echoes](https://seilrecords.bandcamp.com/track/echoes)* by Jogging House. That's nice.

Ok:  
Open a terminal and install [bundler](https://bundler.io), if you haven't already:
```
gem install bundler
```
Clone the [**Loom** repo](https://gitlab.com/cscottmills/loom), change to the `loom` directory, and run:
```
bundle install
```
That will install jekyll and its dependencies. Now install [juice](https://github.com/Automattic/juice), which will handle inlining styles in our emails:
```
npm install juice -g
```
Open up `_config.yml` in a text editor and change the placeholders to suit you. Finally, build the site and get it running on a local server:
```
bundle exec jekyll serve
```
You can see and touch the site at [http://localhost:4000](http://localhost:4000).

## To weave an email
Write the content of the email as a [post](https://jekyllrb.com/docs/posts). When it's all ready to go, run:
```
./scripts/email.sh
```
The email HTML will be copied to your clipboard. To build the site for sharing on the web, make sure you set `baseurl` in `_config-web.yml` to wherever you'll be hosting the site, and run:
```
./scripts/publish.sh
```
You'll find the rendered files in the `_site` directory.

## Structure
**Loom** is organized like any old [jekyll site](https://jekyllrb.com/docs/structure/), with a few additions:

`email.html` is the template that generates an HTML email from your latest post. Be sure to add the unsubscribe tag from your newsletter service to the link near the end of the file. The surrounding `raw` tags prevent [liquid](https://jekyllrb.com/docs/liquid/) from trying to metabolize the unsubscribe tag.

`resources/css/email.scss.liquid` is the stylesheet that gets included and inlined in `email.html` when the site is built. Note that the stylesheet will look for webfont files wherever `baseurl` points to in `_config-web.yml`. You can always point it somewhere else. This stylesheet shares some typographic styles with the rest of the site by way of `@mixin`s, but you can easily decouple the two by removing the `@mixin`s and writing brand new styles for the email.

`latest.md` generates a page that always redirects to the latest post. It's a handy link to include in welcome emails, profiles, engravings in stone, or anywhere else that's a chore to update.

`scripts` is a directory containing two bash scripts (spells, really) that occasion the actual weaving:

`scripts/email.sh` builds the site with the 'email' [environment](https://jekyllrb.com/docs/configuration/environments) value, inlines the styles, and copies the email HTML to your clipboard.

`scripts/publish.sh` builds the site with the 'production' environment value and the additional `_config-web.yml` file (which allows you to set a base URL, and excludes `email.html` and `email.scss.liquid` from the built site), and if you have SSH access to your webserver (*and* have added the user, IP and path to the script), it will shuttle the built site over to the server via [rsync](https://rsync.samba.org). Careful with rsync, it is perfectly capable of destroying what is most dear to you, and when it does, it will show not the slightest glimmer of recognition. Otherwise a friendly companion.

## Colophon
**Loom** is made by [C.S. Mills](https://cscottmills.com), who has been publishing his own [newsletter](https://cscottmills.com/polylith) since early 2019. The type around here is set in [DejaVu Sans Mono](https://dejavu-fonts.github.io/), which is based on Bitstream Vera Sans Mono designed by Jim Lyles.

## License
All this is offered under the terms of [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html) or later.